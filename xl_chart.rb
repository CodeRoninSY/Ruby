#!/usr/bin/env ruby -w
# xl_chart.rb
# Dev: CodeRoninSY
# Date: <2020-12-03>
#
require 'write_xlsx'

workbook = WriteXLSX.new('xl_chart_01.xlsx')
worksheet = workbook.add_worksheet

# Add the worksheet data the chart refers to
data = [
  [ 'Category', 2, 3, 4, 5, 6, 7],
  [ 'Value',    1, 4, 5, 2, 1, 5 ]
]

worksheet.write('A1', data)

# add a worksheet chart
chart = workbook.add_chart(:type => 'column')

# configure the chart
chart.add_series(
  :categories => '=Sheet1!$A$2:$A$7',
  :values      => '=Sheet1!$B$2:$B$7',
  :name       => 'Test data series',
)
# more usefully when generating the range programmatically,
# an array with zero indexed row/column values:
# [ sheetname, row_start, row_end, col_start, col_end ]

workbook.close

