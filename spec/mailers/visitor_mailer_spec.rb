require "rails_helper"

RSpec.describe VisitorMailer, type: :mailer do

  it 'sends an email after they have register an account' do
    expect { user = FactoryGirl.create(:user) }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
