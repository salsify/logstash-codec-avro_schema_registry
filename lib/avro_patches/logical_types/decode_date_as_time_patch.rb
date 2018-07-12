# The avro-patches gem will convert some date-related logical-types in
# Avro schemas to Ruby Date and Time objects.
#
# LogStash has methods to convert certain Ruby classes into JSON
# values, but it does not support Ruby's Date class. It does support
# Time (which is used by the timestamp-micros and timestamp-millis
# logical types), so we convert the Date object to Time here.
Avro::LogicalTypes::IntDate.class_eval do
  EPOCH_START = Date.new(1970, 1, 1)

  def self.decode(int)
    (EPOCH_START + int).to_time.utc
  end
end
