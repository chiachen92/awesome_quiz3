require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:idea) { FactoryGirl.create :idea }
  let(:user) { FactoryGirl.create :user }
  # let(:comment) { FactoryGirl.create :comment }

  # `let` is syntactic sugar for :
  # before do
  #   idea = FactoryGirl.create :idea
  # end

  describe '#create' do
    context 'User is NOT signed in' do
      it 'redirects the user to the sign in page' do
        post :create, params: {idea_id: idea.id, comment: {body: 'Some body text.'}}

        expect(response).to redirect_to(new_session_path)
      end
    end


    context 'User is signed in' do
      it 'allows the user to' do
        login(user)
        post :create, params: {idea_id: idea.id, comment: {body: 'Some body text.'}}
      expect(response).to redirect_to idea_path(@idea)
      end
    end
  end
end
