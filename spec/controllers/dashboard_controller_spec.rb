describe DashboardController do
  let(:course) { create :course }
  let(:student) { create :student, courses: [course] }
  before { login_as student }

  describe 'GET index' do
    it 'assigns all courses as @courses' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:courses)).to include course
    end
  end
end
