require 'spec_helper'
describe 'testing' do
  context 'with defaults for all parameters' do
    it { should contain_class('testing') }
    it { should contain_class('git')     }
    it { should contain_class('nginx')   }
  end
end
