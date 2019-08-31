class FlightsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :code, :from, :to, :date, :price, :duration
end
