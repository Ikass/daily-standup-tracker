module RequestMacros
  def login_user
    before(:each) do
      allow(Session).to receive(:find_by).and_return(true)
    end
  end
end
