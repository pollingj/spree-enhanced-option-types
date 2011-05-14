Prototype.class_eval do
  has_and_belongs_to_many :option_types, :order => "option_types_prototypes.position ASC"
  has_many :option_types_prototypes
end
