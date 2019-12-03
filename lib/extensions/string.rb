class String
  def brief_version(limit, trailing='...more', path, options)
    self.to(limit) + "#{link_to(trailing, path, options)}"
  end
end
