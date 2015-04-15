describe CoursesController do
  it { expect(get: '/courses').to route_to('courses#index') }
  it { expect(get: '/courses/new').to route_to('courses#new') }
  it { expect(get: '/courses/1').to route_to('courses#show', id: '1') }
  it { expect(get: '/courses/1/edit').to route_to('courses#edit', id: '1') }
  it { expect(post: '/courses').to route_to('courses#create') }
  it { expect(put: '/courses/1').to route_to('courses#update', id: '1') }
  it { expect(delete: '/courses/1').to route_to('courses#destroy', id: '1') }
end
