describe DiscussionsController do
  let(:teacher) { create :teacher }
  let(:valid_attributes) { { title: 'New discussion', question: 'some?', author_id: teacher.id } }
  let(:invalid_attributes) { { title: '' } }
  let(:course) { create :course }
  before { login_as teacher }

  describe 'GET index' do
    let(:discussion) { create :discussion, course: course }

    it 'assigns all discussions as @discussions' do
      get :index, course_id: course
      expect(response).to render_template :index
      expect(assigns(:discussions)).to include discussion
    end
  end

  describe 'GET show' do
    let(:discussion) { create :discussion, course: course }

    it 'assigns the requested discussion as @discussion' do
      get :show, course_id: course, id: discussion
      expect(response).to render_template :show
      expect(assigns(:discussion)).to eq(discussion)
    end
  end

  describe 'GET new' do
    it 'assigns a new discussion as @discussion' do
      get :new, course_id: course
      expect(response).to render_template :new
      expect(assigns(:discussion)).to be_a_new(Discussion)
    end
  end

  describe 'GET edit' do
    let(:discussion) { create :discussion, course: course }

    it 'assigns the requested discussion as @discussion' do
      get :edit, course_id: course, id: discussion
      expect(response).to render_template :edit
      expect(assigns(:discussion)).to eq(discussion)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Discussion' do
        expect do
          post :create, course_id: course, discussion: valid_attributes
        end.to change(Discussion, :count).by(1)
      end

      it 'assigns a newly created discussion as @discussion' do
        post :create, course_id: course, discussion: valid_attributes
        expect(assigns(:discussion)).to be_a(Discussion)
        expect(assigns(:discussion)).to be_persisted
      end

      it 'redirects to the created discussion' do
        post :create, course_id: course, discussion: valid_attributes
        expect(response).to redirect_to [course, Discussion.last]
        expect(flash[:notice]).to eq 'Discussion was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved discussion as @discussion' do
        post :create, course_id: course, discussion: invalid_attributes
        expect(assigns(:discussion)).to be_a_new(Discussion)
      end

      it 're-renders the "new" template' do
        post :create, course_id: course, discussion: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:discussion) { create :discussion, course: course }

    describe 'with valid params' do
      let(:new_attributes) { { title: 'New discussion' } }

      it 'updates the requested discussion' do
        expect do
          put :update, course_id: course, id: discussion, discussion: new_attributes
        end.to change { discussion.reload.title }.to new_attributes[:title]
      end

      it 'assigns the requested discussion as @discussion' do
        put :update, course_id: course, id: discussion, discussion: valid_attributes
        expect(assigns(:discussion)).to eq(discussion)
      end

      it 'redirects to the discussion' do
        put :update, course_id: course, id: discussion, discussion: valid_attributes
        expect(response).to redirect_to [course, discussion]
      end
    end

    describe 'with invalid params' do
      it 'assigns the discussion as @discussion' do
        put :update, course_id: course, id: discussion, discussion: invalid_attributes
        expect(assigns(:discussion)).to eq(discussion)
      end

      it "re-renders the 'edit' template" do
        put :update, course_id: course, id: discussion, discussion: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested discussion' do
      discussion = create(:discussion)
      expect do
        delete :destroy, course_id: course, id: discussion
      end.to change(Discussion, :count).by(-1)
    end

    it 'redirects to the discussion list' do
      discussion = create(:discussion)
      delete :destroy, course_id: course, id: discussion
      expect(response).to redirect_to course
    end
  end
end
