describe SubmissionsController do
  let(:student) { create :student }
  let(:submission) { create :submission }
  let(:valid_attributes) { { file: 'file/path', atuhor_id: student.id } }
  let(:invalid_attributes) { { file: '' } }
  let(:activity) { create :activity }
  before { login_as student }

  describe 'GET index' do
    it 'assigns all submissions as @submissions' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:submissions)).to include submission
    end
  end

  describe 'GET show' do
    it 'assigns the requested submission as @submission' do
      get :show, id: submission
      expect(response).to render_template :show
      expect(assigns(:submission)).to eq(submission)
    end
  end

  describe 'GET new' do
    it 'assigns a new submission as @submission' do
      get :new, activity_id: activity.id
      expect(response).to render_template :new
      expect(assigns(:submission)).to be_a_new(Submission)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested submission as @submission' do
      get :edit, id: submission
      expect(response).to render_template :edit
      expect(assigns(:submission)).to eq(submission)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Submission' do
        expect do
          post :create, submission: valid_attributes
        end.to change(Submission, :count).by(1)
      end

      it 'assigns a newly created submission as @submission' do
        post :create, submission: valid_attributes
        expect(assigns(:submission)).to be_a(Submission)
        expect(assigns(:submission)).to be_persisted
      end

      it 'redirects to the created submission' do
        post :create, submission: valid_attributes
        expect(response).to redirect_to(Submission.last)
        expect(flash[:notice]).to eq 'Submission was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved submission as @submission' do
        post :create, submission: invalid_attributes
        expect(assigns(:submission)).to be_a_new(Submission)
      end

      it 're-renders the "new" template' do
        post :create, submission: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { { file: 'new/file/path' } }

      it 'updates the requested submission' do
        expect do
          put :update, id: submission, submission: new_attributes
        end.to change { submission.reload.file }.to new_attributes[:file]
      end

      it 'assigns the requested submission as @submission' do
        put :update, id: submission, submission: valid_attributes
        expect(assigns(:submission)).to eq(submission)
      end

      it 'redirects to the submission' do
        put :update, id: submission, submission: valid_attributes
        expect(response).to redirect_to(submission)
      end
    end

    describe 'with invalid params' do
      it 'assigns the submission as @submission' do
        put :update, id: submission, submission: invalid_attributes
        expect(assigns(:submission)).to eq(submission)
      end

      it "re-renders the 'edit' template" do
        put :update, id: submission, submission: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested submission' do
      submission = create(:submission)
      expect do
        delete :destroy, id: submission
      end.to change(Submission, :count).by(-1)
    end

    it 'redirects to the submission list' do
      submission = create(:submission)
      delete :destroy, id: submission
      expect(response).to redirect_to(submissions_url)
    end
  end
end
