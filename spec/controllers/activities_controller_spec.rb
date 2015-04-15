describe ActivitiesController do
  let(:teacher) { create :teacher }
  let(:valid_attributes) { { title: 'New activity' } }
  let(:invalid_attributes) { { title: '' } }
  let(:course) { create :course }
  let(:learning_unit) { create :learning_unit, course: course }
  before { login_as teacher }

  describe 'GET index' do
    let(:activity) { create :activity, learning_unit: learning_unit }

    it 'assigns all activities as @activities' do
      get :index, course_id: course, learning_unit_id: learning_unit
      expect(response).to render_template :index
      expect(assigns(:activities)).to include activity
    end
  end

  describe 'GET show' do
    let(:activity) { create :activity, learning_unit: learning_unit }

    it 'assigns the requested activity as @activity' do
      get :show, course_id: course, learning_unit_id: learning_unit, id: activity
      expect(response).to render_template :show
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'GET new' do
    it 'assigns a new activity as @activity' do
      get :new, course_id: course, learning_unit_id: learning_unit
      expect(response).to render_template :new
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe 'GET edit' do
    let(:activity) { create :activity, learning_unit: learning_unit }

    it 'assigns the requested activity as @activity' do
      get :edit, course_id: course, learning_unit_id: learning_unit, id: activity
      expect(response).to render_template :edit
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Activity' do
        expect do
          post :create, course_id: course, learning_unit_id: learning_unit, activity: valid_attributes
        end.to change(Activity, :count).by(1)
      end

      it 'assigns a newly created activity as @activity' do
        post :create, course_id: course, learning_unit_id: learning_unit, activity: valid_attributes
        expect(assigns(:activity)).to be_a(Activity)
        expect(assigns(:activity)).to be_persisted
      end

      it 'redirects to the created activity' do
        post :create, course_id: course, learning_unit_id: learning_unit, activity: valid_attributes
        expect(response).to redirect_to [course, learning_unit, Activity.last]
        expect(flash[:notice]).to eq 'Activity was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved activity as @activity' do
        post :create, course_id: course, learning_unit_id: learning_unit, activity: invalid_attributes
        expect(assigns(:activity)).to be_a_new(Activity)
      end

      it 're-renders the "new" template' do
        post :create, course_id: course, learning_unit_id: learning_unit, activity: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:activity) { create :activity, learning_unit: learning_unit }

    describe 'with valid params' do
      let(:new_attributes) { { title: 'New activity' } }

      it 'updates the requested activity' do
        expect do
          put :update,
              course_id: course, learning_unit_id: learning_unit, id: activity, activity: new_attributes
        end.to change { activity.reload.title }.to new_attributes[:title]
      end

      it 'assigns the requested activity as @activity' do
        put :update,
            course_id: course, learning_unit_id: learning_unit, id: activity, activity: valid_attributes
        expect(assigns(:activity)).to eq(activity)
      end

      it 'redirects to the activity' do
        put :update,
            course_id: course, learning_unit_id: learning_unit, id: activity, activity: valid_attributes
        expect(response).to redirect_to [course, learning_unit, activity]
      end
    end

    describe 'with invalid params' do
      it 'assigns the activity as @activity' do
        put :update,
            course_id: course, learning_unit_id: learning_unit, id: activity, activity: invalid_attributes
        expect(assigns(:activity)).to eq(activity)
      end

      it "re-renders the 'edit' template" do
        put :update,
            course_id: course, learning_unit_id: learning_unit, id: activity, activity: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested activity' do
      activity = create(:activity)
      expect do
        delete :destroy, course_id: course, learning_unit_id: learning_unit, id: activity
      end.to change(Activity, :count).by(-1)
    end

    it 'redirects to the activity list' do
      activity = create(:activity)
      delete :destroy, course_id: course, learning_unit_id: learning_unit, id: activity
      expect(response).to redirect_to [course, learning_unit]
    end
  end
end
