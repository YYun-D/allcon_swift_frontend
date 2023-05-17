# allcon_swift_frontend

![1](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/43d6a96c-fbcd-40b9-9687-7f1ae68f8266)

먼저, 스토리보드를 사용하여 전체적인 페이지 디자인을 구현하였습니다.
일단 전체적인 페이지는 Navigation Controller를 이용하여 페이지가 Push, Pop을 자유롭게 할 수 있도록 하고 대부분의 페이지는 Scrollview와 VerticalStackView를 이용하여 틀을 잡고 그 위에 각 페이지에 적합한 UIButton, UILabel, TextField 등을 사용하여 페이지를 구성하였습니다. 그리고 추천리스트페이지, 검색페이지, 마이페이지는 TabBarViewController를 사용하여 세 개의 페이지를 탭 바의 버튼을 누르면 자유롭게 이동할 수 있도록 하였습니다.

![2](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/f2c9f18d-fe4e-4e6e-995c-44ffc2181508)

첫 페이지는 로그인 페이지로 먼저 아이디와 비밀번호를 TextField를 입력하고 로그인 UIButton을 누를 시에 TextField에 입력한 아이디와 비밀번호를 가져와 로그인 기능을 하는 백엔드에 보냅니다. 이 후 백엔드에서 JWT(JSONWebToken)을 보내주면 로그인을 성공한 것으로 인식하고 JWT 을 UserDefaults에 저장합니다. 그리고 가져온 JWT을 이용하여 현재 유저정보를 알 수 있는 백엔드에 접속하여 현재 유저의 정보를 가져옵니다. 가져온 정보에 유저의 취향이 없다면 취향 선택 페이지를 Push 하고 취향이 있다면 유저의 취향을 가지고 와서 다시 백엔드에 유저의 취향을 보내면 취향에 맞는 영화들과 넷플릭스 top10, 왓챠 top10을 백엔드로부터 불러온 후에 TabBar 페이지를 Push 합니다. 만약에 JWT 을 받지 못하였을 시에 로그인을 실패한 것으로 인식하고 ‘아이디와 비밀번호가 일치하지 않습니다.’라는 경고 창을 띄웁니다.

![3](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/8758bf5c-3055-4050-bdf0-fee3a1d540c4)

회원가입은 로그인 페이지에서 회원가입 버튼을 누를 시에 회원가입 페이지로 넘어갑니다. 회원가입페이지에서는 로그인과 마찬가지로 회원가입 버튼을 누를 시에 TextField의 아이디와 비밀번호를 가지고 백엔드에 보냅니다. 회원가입이 성공하면 회원가입 페이지를 pop하고 실패하면 경고창을 띄웁니다.

![4](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/a057612e-5bf5-4e6c-8b3b-7009ce116af5)

취향선택페이지는 10개의 각 취향을 대표하는 장르의 영화 포스터를 UIButton에 넣고 투명도를 0.5로 설정하고 포스터를 누르면 투명도를 없애는 방식으로 구현하였습니다. 선택하고 선택완료 버튼을 누르면 선택한 취향을 백엔드에 보낸 후에 백엔드로부터 추천받을 영화리스트를 가져온 후에 TabBar 페이지를 Push 합니다. 만약 선택을 하지 않았을 경우에는 경고창을 띄웁니다.

![5](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/211d27f4-052c-43d4-bd73-9f37db5a1df0)

TabBar 페이지의 첫 번째 페이지인 추천리스트에는 백엔드로부터 받아온 취향추천리스트, 넷플릭스 top10, 왓챠 top10의 이미지 url을 통해 이미지를 불러와 UIButton에 이미지를 넣습니다

![6](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/4fff3bfd-b3c7-4ce3-b585-9676ec4f661b)

검색 페이지는 TextField에 검색할 내용을 작성하고 UIButton을 누르면 백엔드에 TextField에 작성한 내용을 보내고 백엔드에서 영화를 검색한 정보를 가져오면 영화들의 이미지 url을 통해 이미지를 불러와 UIButton에 이미지를 넣습니다.

![7](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/900481a4-3bda-450d-a00d-deb04cd25e7f)

마이페이지는 유저의 취향 정보를 보여주고 언제든지 수정할 수 있도록 각 취향들을 UIButton으로 구현하였습니다. 그리고 백엔드로부터 가져온 유저정보를 통해 유저가 최근 검색한 영화와 찜한 영화를 언제든지 볼 수 있도록 UIButton에 영화 포스터를 넣었습니다.

![8](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/0d4118f4-1b12-4c21-9202-d9246350d7d1)

상세페이지는 영화포스터를 띄운 UIButton을 누를 시에 Push가 됩니다. UIButton을 누를 때에 누른 버튼의 영화정보들을 가진 url을 가지고와 백엔드에 보내줍니다. 이 후 백엔드에서 영화 정보url을 통해 크롤링을 하여 가지고 오면 상세페이지에 정보들을 띄웁니다. 그리고 혹시 이전에 클릭한 적이 있는 영화인지를 밴엔드를 통해 확인한 후에 있다면 이 영화를 유저가 찜을 하였는 지 확인한 후에 찜을 한적이 있다면 찜버튼을 활성화합니다.

![9](https://github.com/YYun-D/allcon_swift_frontend/assets/85883811/fe8a695c-7285-4225-8d66-a56b8f6b9e12)

리뷰남기기 페이지는 상세페이지 가장 아래에 리뷰 칸이 있고 리뷰 옆에 +버튼을 누르면 리뷰남기기 페이지로 넘어갑니다. 리뷰남기기 페이지에는 다른 유저가 개발한 Cosmos모듈을 불러와 별점을 scroll를 이용하여 줄 수 있도록 하였습니다. 그리고 별점아래에 TextView를 만들어 리뷰를 남길 수 있도록 하였습니다. 이 후에 아래 제출 버튼을 누르면 백엔드에 영화, 별점, 리뷰내용을 보내면 리뷰내용이 작성됩니다.
