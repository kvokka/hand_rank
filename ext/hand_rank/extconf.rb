require "mkmf"
$CFLAGS+=" -O3"
create_makefile "hand_rank/hand_rank"

require 'pathname'

data_file = Pathname.new(File.expand_path('..', __dir__)).join "../lib/hand_rank/ranks.data"

begin
  %x[gunzip -f #{data_file}.gz] unless File.exists?(data_file)
rescue => e
  puts <<-EOF
  Something go wrong with copying ranks.data file from
  #{data_file}
  to gem folder

  Please install it manually in path/to/hand_rank/lib/hand_hank
  EOF
end
