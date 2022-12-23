module ItemContainer
  module ClassMethods
  end

  module InstanceMethods
    def add_item(item)
      @items.push(item)
    end

    def remove_item(item)
      @items.delete(item)
    end

    def delete_items(items)
      items.clear
    end

    def method_missing(*_args)
      puts 'Method is missing!'
    end
  end

  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.extend(InstanceMethods)
  end
end
