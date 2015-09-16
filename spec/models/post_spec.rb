require 'rails_helper'

# RSpec.describe Post, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Post do
  it 'has a valid factory' do
    expect(create(:post)).to be_valid
  end

  it 'is not valid without a title' do
    expect(build(:post, title: nil)).to_not be_valid
  end

  it 'is not published yet' do
    # skip 'because i want to skip it'
    poster = build(:post)
    expect(poster.published).to be false
  end

  it 'is published' do
    poster = build(:post, published: true)
    expect(poster.published).to be true
  end

  # it 'responds to title' do
  #   respond_to(:title)
  # end

  it { is_expected.to respond_to(:title) }

  it 'has a title over 3 characters' do
    poster = build(:post)
    expect(poster.title.size).to be > 3
  end

  it "is a silly test" do
    @taco = "buttons"
    expect(@taco).to eq("buttons")
  end

  it 'has a string for a title' do
    poster = build(:post)
    expect(poster.title).to be_instance_of(String)
  end

end
