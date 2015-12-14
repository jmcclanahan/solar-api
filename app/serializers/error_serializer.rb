module ErrorSerializer

  def ErrorSerializer.serialize(errors)
    return if errors.nil?

    json = {}
    new_hash = errors.to_hash(true).map do |k, v|
      v.map do |msg|
        {text: msg, severity: "error" }
      end
    end.flatten
    json[:messages] = new_hash
    json
  end

end
