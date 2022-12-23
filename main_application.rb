class MainApplication
  attr_accessor :path_to_csv, :path_to_json, :path_to_txt

  def initialize(
    path_to_csv = nil,
    path_to_json = nil,
    path_to_txt = nil
  )
    @path_to_csv = path_to_csv
    @path_to_json = path_to_json
    @path_to_txt = path_to_txt
  end
end
