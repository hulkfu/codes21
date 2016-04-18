require 'codes21'

describe Codes21 do
  before { File.delete "result.txt" if File.exists?("result.txt") }

  it "merge codes into one txt file" do
    Codes21.run ".", "rb", "result.txt"
    expect(File.exists?("result.txt")).to eq(true)

  end
end
