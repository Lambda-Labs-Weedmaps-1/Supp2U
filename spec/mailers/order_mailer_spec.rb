require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "order_mailer" do
    let(:mail) {described_class.order_mailer(user).deliver_now}
  end

  it 'renders the subject' do
  expect(mail.subject).to eq('Your order has been placed')  
  end

  it 'user has an email' do
    expect(mail.to).to eq([user.email])
  end

  it 'sender email' do
    expect(mail.from).to eq(['noreply@devteam.com'])
  end
  
end
