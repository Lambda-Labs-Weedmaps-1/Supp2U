require "rails_helper"

RSpec.describe SaleMailer, type: :mailer do
  describe "sale_mailer" do
    let(:mail) {described_class.sale_mailer(user).deliver_now}
  end

  it 'renders the subject' do
  expect(mail.subject).to eq('You have an order.')  
  end

  it 'user has an email' do
    expect(mail.to).to eq([user.email])
  end

  it 'sender email' do
    expect(mail.from).to eq(['noreply@devteam.com'])
  end
end
