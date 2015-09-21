require 'rails_helper'
require 'shared_examples/standard_content'

RSpec.describe Article do
  it_behaves_like('standard content') #this runs through all of the specs from the standard_content file

  it "responds to a mock article" do
    dbl = double('Mock Article')
    allow(dbl).to receive(:title).and_return('Tacos and you')

    allow(Article).to receive(:find).and_return(dbl)

    @article = Article.find
    expect(@article.title).to eq('Tacos and you')
  end

  describe "doubles" do
    it "can expect a call after it is received" do
      dbl = spy("chant") #note the use of spy here instead of double
      allow(dbl).to receive(:hey).and_return("Ho")
      dbl.hey
      expect(dbl).to have_received(:hey)
    end
  end
end
