require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'reek/method_checker'
require 'reek/report'

include Reek

describe MethodChecker, "with no method definitions" do  
  before(:each) do
    @rpt = Report.new
    @cchk = MethodChecker.new(@rpt, 'Thing')
  end

  it 'should report no problems for empty source code' do
    @cchk.check_source('')
    @rpt.should be_empty
  end

  it 'should report no problems for empty class' do
    @cchk.check_source('class Fred; end')
    @rpt.should be_empty
  end
end

describe MethodChecker, 'when given a C extension' do
  before(:each) do
    @cchk = MethodChecker.new(Report.new, 'Thing')
  end

  it 'should ignore :cfunc' do
    @cchk.check_object(Enumerable)
  end
end