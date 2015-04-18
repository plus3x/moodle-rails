describe UploadFilesController do
  let(:student) { create :student }
  let(:upload_file) { create :upload_file }
  let(:valid_attributes) { { file: 'file/path', atuhor_id: student.id } }
  let(:invalid_attributes) { { file: '' } }
  let(:activity) { create :activity }
  before { login_as student }

  describe 'GET index' do
    it 'assigns all upload_files as @upload_files' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:upload_files)).to include upload_file
    end
  end

  describe 'GET show' do
    it 'assigns the requested upload_file as @upload_file' do
      get :show, id: upload_file
      expect(response).to render_template :show
      expect(assigns(:upload_file)).to eq(upload_file)
    end
  end

  describe 'GET new' do
    it 'assigns a new upload_file as @upload_file' do
      get :new, activity_id: activity.id
      expect(response).to render_template :new
      expect(assigns(:upload_file)).to be_a_new(UploadFile)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested upload_file as @upload_file' do
      get :edit, id: upload_file
      expect(response).to render_template :edit
      expect(assigns(:upload_file)).to eq(upload_file)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new UploadFile' do
        expect do
          post :create, upload_file: valid_attributes
        end.to change(UploadFile, :count).by(1)
      end

      it 'assigns a newly created upload_file as @upload_file' do
        post :create, upload_file: valid_attributes
        expect(assigns(:upload_file)).to be_a(UploadFile)
        expect(assigns(:upload_file)).to be_persisted
      end

      it 'redirects to the created upload_file' do
        post :create, upload_file: valid_attributes
        expect(response).to redirect_to(UploadFile.last)
        expect(flash[:notice]).to eq 'UploadFile was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved upload_file as @upload_file' do
        post :create, upload_file: invalid_attributes
        expect(assigns(:upload_file)).to be_a_new(UploadFile)
      end

      it 're-renders the "new" template' do
        post :create, upload_file: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { { file: 'new/file/path' } }

      it 'updates the requested upload_file' do
        expect do
          put :update, id: upload_file, upload_file: new_attributes
        end.to change { upload_file.reload.file }.to new_attributes[:file]
      end

      it 'assigns the requested upload_file as @upload_file' do
        put :update, id: upload_file, upload_file: valid_attributes
        expect(assigns(:upload_file)).to eq(upload_file)
      end

      it 'redirects to the upload_file' do
        put :update, id: upload_file, upload_file: valid_attributes
        expect(response).to redirect_to(upload_file)
      end
    end

    describe 'with invalid params' do
      it 'assigns the upload_file as @upload_file' do
        put :update, id: upload_file, upload_file: invalid_attributes
        expect(assigns(:upload_file)).to eq(upload_file)
      end

      it "re-renders the 'edit' template" do
        put :update, id: upload_file, upload_file: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested upload_file' do
      upload_file = create(:upload_file)
      expect do
        delete :destroy, id: upload_file
      end.to change(UploadFile, :count).by(-1)
    end

    it 'redirects to the upload_file list' do
      upload_file = create(:upload_file)
      delete :destroy, id: upload_file
      expect(response).to redirect_to(upload_files_url)
    end
  end
end
