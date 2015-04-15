describe CoursesController do
  let(:manager) { create :manager }
  before { login_as manager }

  let(:valid_attributes) { { title: 'New course' } }
  let(:invalid_attributes) { { title: '' } }

  describe 'GET index' do
    let(:course) { create :course }

    it 'assigns all courses as @courses' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:courses)).to include course
    end
  end

  describe 'GET show' do
    let(:course) { create :course }

    it 'assigns the requested course as @course' do
      get :show, id: course.to_param
      expect(response).to render_template :show
      expect(assigns(:course)).to eq(course)
    end
  end

  describe 'GET new' do
    it 'assigns a new course as @course' do
      get :new
      expect(response).to render_template :new
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe 'GET edit' do
    let(:course) { create :course }

    it 'assigns the requested course as @course' do
      get :edit, id: course.to_param
      expect(response).to render_template :edit
      expect(assigns(:course)).to eq(course)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Course' do
        expect do
          post :create, course: valid_attributes
        end.to change(Course, :count).by(1)
      end

      it 'assigns a newly created course as @course' do
        post :create, course: valid_attributes
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it 'redirects to the created course' do
        post :create, course: valid_attributes
        expect(response).to redirect_to(Course.last)
        expect(flash[:notice]).to eq 'Course was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved course as @course' do
        post :create, course: invalid_attributes
        expect(assigns(:course)).to be_a_new(Course)
      end

      it 're-renders the "new" template' do
        post :create, course: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:course) { create :course }

    describe 'with valid params' do
      let(:new_attributes) { { title: 'New course' } }

      it 'updates the requested course' do
        expect do
          put :update, id: course.to_param, course: new_attributes
        end.to change { course.reload.title }.to new_attributes[:title]
      end

      it 'assigns the requested course as @course' do
        put :update, id: course.to_param, course: valid_attributes
        expect(assigns(:course)).to eq(course)
      end

      it 'redirects to the course' do
        put :update, id: course.to_param, course: valid_attributes
        expect(response).to redirect_to(course)
      end
    end

    describe 'with invalid params' do
      it 'assigns the course as @course' do
        put :update, id: course.to_param, course: invalid_attributes
        expect(assigns(:course)).to eq(course)
      end

      it "re-renders the 'edit' template" do
        put :update, id: course.to_param, course: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested course' do
      course = create(:course)
      expect do
        delete :destroy, id: course.to_param
      end.to change(Course, :count).by(-1)
    end

    it 'redirects to the course list' do
      course = create(:course)
      delete :destroy, id: course.to_param
      expect(response).to redirect_to(courses_url)
    end
  end
end
