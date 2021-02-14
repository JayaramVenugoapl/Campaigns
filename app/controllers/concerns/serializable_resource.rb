module SerializableResource
  def serialize_array(class_name, option)
    ActiveModel::Serializer::CollectionSerializer.new(option, serializer: class_name)
  end

  def serialize_hash(class_name, option)
    class_name.new option 
  end
end