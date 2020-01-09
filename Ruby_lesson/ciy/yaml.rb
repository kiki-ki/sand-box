require 'yaml'
require 'ostruct'
data = YAML.load_file("b.yml")
armor = OpenStruct.new(data["AA"])
p armor.image_name