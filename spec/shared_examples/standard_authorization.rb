shared_examples_for('user not logged in') do

  describe 'attributes' do

    it "should be redirected to signin" do
      expect(response).to redirect_to(new_user_session_path)
    end

  end

end