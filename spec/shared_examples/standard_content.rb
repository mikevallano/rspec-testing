require 'rails_helper'

shared_examples_for('standard content') do

  describe 'attributes' do

    it "responds to :title" do
      subject.title = 'This is a test title'
      expect(subject.title).to eq('This is a test title')
    end

    it "responds to :content" do
      subject.content = "This is content"
      expect(subject.content).to eq("This is content")
    end

  end

end