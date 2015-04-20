describe CommentsController do
  let(:teacher) { create :teacher }
  let(:valid_attributes) { { text: 'My text', discussion_id: discussion.id, author_id: teacher.id } }
  let(:invalid_attributes) { { text: '', discussion_id: discussion.id, author_id: teacher.id } }
  let(:course) { create :course }
  let(:discussion) { create :discussion, course: course }
  before { login_as teacher }

  describe 'GET index' do
    let(:comment) { create :comment, discussion: discussion }

    it 'assigns all comments as @comments' do
      get :index, course_id: course, discussion_id: discussion
      expect(response).to render_template :index
      expect(assigns(:comments)).to include comment
    end
  end

  describe 'GET show' do
    let(:comment) { create :comment, discussion: discussion }

    it 'assigns the requested comment as @comment' do
      get :show, course_id: course, discussion_id: discussion, id: comment
      expect(response).to render_template :show
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe 'GET new' do
    it 'assigns a new comment as @comment' do
      get :new, course_id: course, discussion_id: discussion
      expect(response).to render_template :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe 'GET edit' do
    let(:comment) { create :comment, discussion: discussion }

    it 'assigns the requested comment as @comment' do
      get :edit, course_id: course, discussion_id: discussion, id: comment
      expect(response).to render_template :edit
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Comment' do
        expect do
          post :create, course_id: course, discussion_id: discussion, comment: valid_attributes
        end.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        post :create, course_id: course, discussion_id: discussion, comment: valid_attributes
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it 'redirects to the created comment' do
        post :create, course_id: course, discussion_id: discussion, comment: valid_attributes
        expect(response).to redirect_to [course, discussion, Comment.last]
        expect(flash[:notice]).to eq 'Comment was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved comment as @comment' do
        post :create, course_id: course, discussion_id: discussion, comment: invalid_attributes
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 're-renders the "new" template' do
        post :create, course_id: course, discussion_id: discussion, comment: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:comment) { create :comment, discussion: discussion }

    describe 'with valid params' do
      let(:new_attributes) { { text: 'New comment' } }

      it 'updates the requested comment' do
        expect do
          put :update,
              course_id: course, discussion_id: discussion, id: comment, comment: new_attributes
        end.to change { comment.reload.text }.to new_attributes[:text]
      end

      it 'assigns the requested comment as @comment' do
        put :update,
            course_id: course, discussion_id: discussion, id: comment, comment: valid_attributes
        expect(assigns(:comment)).to eq(comment)
      end

      it 'redirects to the comment' do
        put :update,
            course_id: course, discussion_id: discussion, id: comment, comment: valid_attributes
        expect(response).to redirect_to [course, discussion, comment]
      end
    end

    describe 'with invalid params' do
      it 'assigns the comment as @comment' do
        put :update,
            course_id: course, discussion_id: discussion, id: comment, comment: invalid_attributes
        expect(assigns(:comment)).to eq(comment)
      end

      it "re-renders the 'edit' template" do
        put :update,
            course_id: course, discussion_id: discussion, id: comment, comment: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested comment' do
      comment = create(:comment)
      expect do
        delete :destroy, course_id: course, discussion_id: discussion, id: comment
      end.to change(Comment, :count).by(-1)
    end

    it 'redirects to the comment list' do
      comment = create(:comment)
      delete :destroy, course_id: course, discussion_id: discussion, id: comment
      expect(response).to redirect_to [course, discussion]
    end
  end
end
