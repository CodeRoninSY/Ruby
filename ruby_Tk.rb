#!/usr/bin/env ruby
# ruby_Tk.rb
# Dev: CodeRoninSY
# Date: <2020-11-24>
# Tk simple example
#

require 'tk'

$resultVar = TkVariable.new

def myproc
  puts "...OK..."
  exit
end

root = TkRoot.new { title "Hello, World!" }

Lbl = TkLabel.new(root) do
  textvariable
   text 'Hello, World!'
   pack { padx 15 ; pady 15; side 'left' }
end

entry1 = TkEntry.new(root) {
  textvariable "var1"
  pack { side 'left'  }

}
entry2 = TkEntry.new(root) do
  show '*'
end

var1 = TkVariable.new
var2 = TkVariable.new
entry1.textvariable = var1
entry2.textvariable = var2
var1.value = "Enter any text value"
var2.value = "Enter any confidential value"

entry1.place('height' => 25, 'width' => 150)
entry2.place('height' => 25, 'width' => 150)

btn_OK = TkButton.new(root) do
  text "OK"
  command (proc {myproc})
  pack("side" => "bottom", "padx" => "50", "pady" => "10")
end

Lbl['textvariable'] = $resultVar
$resultVar.value = 'Value: Hello, world!'


Tk.mainloop
