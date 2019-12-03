class Event
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  #include Mongoid::MultiParameterAttributes
  include Mongoid::Slug
  include Mongoid::Timestamps

  paginates_per 6

  field :name, type: String
  field :description, type: String
  field :starts, type: DateTime
  field :ends, type: DateTime
  field :location_name, type: String
  field :location_address, type: String
  field :coordinates, type: Array
  field :image_mode, type: String, default: IMAGE_MODES[0]
  field :next_occurrence, type: DateTime
  field :repeat, type: String
  field :duration, type: Integer
  field :notified_at, type: DateTime

  slug :name

  before_save :update_next_occurrence

  after_destroy do |record| 
    d = DeletedRecord.new
    d.record_type = record.class
    d.record_id = record.id
    d.save!
  end

  validates_presence_of :name
  validate :starts_ends

  #attr_accessible :name, :starts, :ends, :location_name, :location_address, :duration,
  #                :image, :remove_image, :description, :image_mode, :repeat, :next_occurrence

  geocoded_by :location_address
  after_validation :geocode, if: ->{ location_address_changed? }
  before_save :calculate_duration

  mount_uploader :image, EventImageUploader

  scope :upcoming, ->(limit) { Event.where(:next_occurrence.gte => Time.now, :ends.gte => Time.now).asc(:next_occurrence).limit(limit) }
  scope :not_ending, ->(limit) { Event.where(:ends.gt => Date.today.beginning_of_day).asc(:starts).limit(limit) }
  scope :upcoming_ongoing, ->(limit) { Event.where(:ends.gte => Time.now).asc(:starts).limit(limit) }
  scope :newest, ->{ desc(:created_at) }

  def lat
    coordinates && coordinates[1]
  end

  def lon
    coordinates && coordinates[0]
  end

  def self.event_repeat_interval
    ['never', 'weekly', 'fortnightly', 'monthly'].map{|tri| [tri.titleize]}
  end

  def to_ical
    IceCube::Schedule.new(Time.parse(self.starts.to_s)) do |s|
      if self.repeat == 'Weekly'
        s.add_recurrence_rule IceCube::Rule.weekly
      elsif self.repeat == 'Fortnightly'
        s.occurrences(Time.parse((self.starts + 14).to_s))
      elsif self.repeat == 'Monthly'
        s.add_recurrence_rule IceCube::Rule.monthly.day_of_month(self.starts.present? ? Time.parse(self.starts.to_s) : DateTime.now.day)
      end
    end
  end

  def update_next_occurrence
    self.next_occurrence = to_ical.next_occurrence
    self
  end

  def calculate_duration
    #if self.repeat != 'Never'
      duration = (self.ends.to_time - self.starts.to_time).to_i
      self.duration = duration
    #end
  end

  def notified?
    !notified_at.nil?
  end


  def next_start_and_end
    if starts.to_date == ends.to_date
      [starts, ends]
    else
      starts = next_occurrence
      ends = (starts.to_time + duration).to_datetime
      [starts, ends]
    end
  end

private

  def starts_ends
    errors.add(:ends, 'Must be after start date') if ends <= starts
  end
end
