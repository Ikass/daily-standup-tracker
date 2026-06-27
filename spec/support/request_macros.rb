module RequestMacros
  def login_user
    let(:current_user) { FactoryBot.create(:user) }

    before(:each) do
      session = current_user.sessions.create!
      allow_any_instance_of(ApplicationController).to receive(:resume_session) do
        Current.session = session
        session
      end
    end
  end
end
