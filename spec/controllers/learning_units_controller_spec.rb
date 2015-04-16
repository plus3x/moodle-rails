describe LearningUnitsController do
  let(:teacher) { create :teacher }
  let(:valid_attributes) { { title: 'New learning_unit' } }
  let(:invalid_attributes) { { title: '' } }
  let(:course) { create :course }
  before { login_as teacher }

  describe 'GET index' do
    let(:learning_unit) { create :learning_unit, course: course }

    it 'assigns all learning_units as @learning_units' do
      get :index, course_id: course
      expect(response).to render_template :index
      expect(assigns(:learning_units)).to include learning_unit
    end
  end

  describe 'GET show' do
    let(:learning_unit) { create :learning_unit, course: course }

    it 'assigns the requested learning_unit as @learning_unit' do
      get :show, course_id: course, id: learning_unit
      expect(response).to render_template :show
      expect(assigns(:learning_unit)).to eq(learning_unit)
    end
  end

  describe 'GET new' do
    it 'assigns a new learning_unit as @learning_unit' do
      get :new, course_id: course
      expect(response).to render_template :new
      expect(assigns(:learning_unit)).to be_a_new(LearningUnit)
    end
  end

  describe 'GET edit' do
    let(:learning_unit) { create :learning_unit, course: course }

    it 'assigns the requested learning_unit as @learning_unit' do
      get :edit, course_id: course, id: learning_unit
      expect(response).to render_template :edit
      expect(assigns(:learning_unit)).to eq(learning_unit)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new LearningUnit' do
        expect do
          post :create, course_id: course, learning_unit: valid_attributes
        end.to change(LearningUnit, :count).by(1)
      end

      it 'assigns a newly created learning_unit as @learning_unit' do
        post :create, course_id: course, learning_unit: valid_attributes
        expect(assigns(:learning_unit)).to be_a(LearningUnit)
        expect(assigns(:learning_unit)).to be_persisted
      end

      it 'redirects to the created learning_unit' do
        post :create, course_id: course, learning_unit: valid_attributes
        expect(response).to redirect_to [course, LearningUnit.last]
        expect(flash[:notice]).to eq 'Learning unit was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved learning_unit as @learning_unit' do
        post :create, course_id: course, learning_unit: invalid_attributes
        expect(assigns(:learning_unit)).to be_a_new(LearningUnit)
      end

      it 're-renders the "new" template' do
        post :create, course_id: course, learning_unit: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:learning_unit) { create :learning_unit, course: course }

    describe 'with valid params' do
      let(:new_attributes) { { title: 'New learning_unit' } }

      it 'updates the requested learning_unit' do
        expect do
          put :update, course_id: course, id: learning_unit, learning_unit: new_attributes
        end.to change { learning_unit.reload.title }.to new_attributes[:title]
      end

      it 'assigns the requested learning_unit as @learning_unit' do
        put :update, course_id: course, id: learning_unit, learning_unit: valid_attributes
        expect(assigns(:learning_unit)).to eq(learning_unit)
      end

      it 'redirects to the learning_unit' do
        put :update, course_id: course, id: learning_unit, learning_unit: valid_attributes
        expect(response).to redirect_to [course, learning_unit]
      end
    end

    describe 'with invalid params' do
      it 'assigns the learning_unit as @learning_unit' do
        put :update, course_id: course, id: learning_unit, learning_unit: invalid_attributes
        expect(assigns(:learning_unit)).to eq(learning_unit)
      end

      it "re-renders the 'edit' template" do
        put :update, course_id: course, id: learning_unit, learning_unit: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested learning_unit' do
      learning_unit = create(:learning_unit)
      expect do
        delete :destroy, course_id: course, id: learning_unit
      end.to change(LearningUnit, :count).by(-1)
    end

    it 'redirects to the learning_unit list' do
      learning_unit = create(:learning_unit)
      delete :destroy, course_id: course, id: learning_unit
      expect(response).to redirect_to course
    end
  end
end
