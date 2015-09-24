require 'rails_helper'
require "pundit/rspec"

describe StorePolicy do
  subject { described_class }
  let(:store) { FactoryGirl.create(:store) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:manager) { FactoryGirl.create(:manager) }
  let(:counselor) { FactoryGirl.create(:counselor) }
  let(:basic_user) { FactoryGirl.create(:user) }

  permissions :create? do
    it "denies access if user is a manager" do
      expect(subject).not_to permit(manager, store)
    end

    it "denies access if user is a counselor" do
      expect(subject).not_to permit(counselor, store)
    end

    it "allows access to admins" do
      expect(subject).to permit(admin, store)
    end
  end

   permissions :show? do
    it "allows access if user is a manager" do
      expect(subject).to permit(manager, store)
    end

    it "allows access if user is a counselor" do
      expect(subject).to permit(counselor, store)
    end

    it "allows access if user is an admin" do
      expect(subject).to permit(admin, store)
    end
  end
end #final ender

# describe StorePolicy do

#   let(:store) { FactoryGirl.create(:store) }

#   subject { StorePolicy.new(user, store) }

#   context "for a visitor" do
#     # let(:user) { nil }
#     let(:user) { nil }

#     it { should permit(:show) }

#     it { should_not permit(:create)  }
#     it { should_not permit(:new)     }
#     it { should_not permit(:update)  }
#     it { should_not permit(:edit)    }
#     it { should_not permit(:destroy) }
#   end

#   context "for an admin" do
#     let(:user) { FactoryGirl.create(:admin) }

#     it { should permit(:show)    }
#     it { should permit(:create)  }
#     it { should permit(:new)     }
#     it { should permit(:update)  }
#     it { should permit(:edit)    }
#     it { should permit(:destroy) }
#   end
# end