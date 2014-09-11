require 'spec_helper'

describe Weblinc::StoreFront::Users::FacebookController do
  routes { Weblinc::StoreFront::Engine.routes }
  let!(:omniauth_user) { create_user }
  describe 'GET create' do
    context 'when the user is omniauthed' do
      before do
        omniauth_user.is_omniauthed = true
        omniauth_user.email = 'pmickus@weblinc.com'
        omniauth_user.save!

        info = double(email: 'pmickus@weblinc.com')
        auth_hash = double(info: info)
        Weblinc::User.stub(from_omniauth: omniauth_user)
        controller.stub(auth_hash: auth_hash)
      end

      it 'logs in the user' do
        controller.should_receive(:login).with(omniauth_user)
        get :create
      end

      it 'does not allow an admin to login with facebook' do
        omniauth_user.admin = true
        omniauth_user.save!
         get :create
        response.should redirect_to(login_path)
      end

      it 'checks to see if the user facebook email matches' do
        controller.stub(check_current_email: false)
        get :create
        flash[:error].should_not be_blank
      end
    end
  end
end
