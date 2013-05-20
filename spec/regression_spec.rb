require 'spec_helper'
require 'pry'

describe "regression fixes" do
  let(:vim) { @vim }
  let(:filename) { 'test.txt' }

  it "is not affected by &whichwrap" do
    set_file_contents <<-EOF
      foo = true
      bar
    EOF

    vim.set 'whichwrap', 'l'

    vim.search 'true'
    vim.switch
    assert_file_contents <<-EOF
      foo = false
      bar
    EOF

    vim.set 'whichwrap&vim'
  end
end
