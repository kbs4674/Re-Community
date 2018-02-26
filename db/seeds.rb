# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 어드민계정
admin_user1 = User.create( email: 'kbs4674@naver.com', nickname: '관리자', password: 'a1274821' )
user = User.find(1)
user.add_role :admin #어드민(rolify+cancancan)
user.update_attribute :admin, true #어드민(devise)
user.add_role :block_yellow #정지계정 : 옐로우카드 (열람만 가능, 댓글 및 게시글 작성 금지)
user.add_role :block_red #정지계정 : 레드카드 (공지사항을 제외한 모든 게시판 열람 금지)
user.add_role :store_boss #사장
user.add_role :real_estate #부동산
user.add_role :univ_professor #교수님
user.add_role :univ_official #대학 관계자 및 직원
user.add_role :graduate_student #대학 관계자 및 직원
user.add_role :special_icon #Special 계정(아이콘 닉네임 적용 허용)
user.add_role :special_vip #Special 계정(배너형 이미지 닉네임 적용 허용)

admin_user2 = User.create( email: 'root@gg.gg', nickname: '루트 관리자', password: '123456' )
user = User.find(2)
user.add_role :admin
user.update_attribute :admin, true

# 테스트 계정
test_user1 = User.create( email: 'test4674@naver.com', nickname: '테스트계정',  password: '123456' )

# 커뮤니티
free = Bulletin.create( title: "자유게시판", content: "자유롭게 이야기 나눌 수 있는 게시판입니다.", user_id: "1" ) #post id : 1
humor = Bulletin.create( title: "유머게시판", content: "바나나가 웃으면 바나나킥!", user_id: "1" ) #post id : 2
group = Bulletin.create( title: "동아리 홍보 게시판", content: "동아리 홍보 전용 게시판 입니다!", user_id: "1" ) #post id : 3
foreigner = Bulletin.create( title: "Foreigner Board", content: "board For Foreigner Bulletin Board, Please use not only Korean, also your language", user_id: "1" ) #post id : 4
vote = Bulletin.create( title: "토론장", content: "어떤 한 주제에 대해 찬/반을 가려가며 논의하는 게시판입니다.<br/>'controversia'는 라틴어로 '논쟁' 이란 뜻이 있음.", user_id: "1", vote: "true" ) #post id : 5

#익명
nonamed = Bulletin.create( title: "익명 자유게시판", content: "익명 자유게시판", user_id: "1", info_no_named: "true" ) #post id : 6
love = Bulletin.create( title: "연애상담 게시판", content: "연애상담 게시판 입니다.", user_id: "1", info_no_named: "true" ) #post id : 7
get_it_out = Bulletin.create( title: "고민고백 게시판", content: "고민고백 게시판 입니다.", user_id: "1", info_no_named: "true" ) #post id : 8

#명소가게 탐방
store1 = Bulletin.create( title: "우리가게 홍보", content: "사장님들이 직접 홍보하는 가게입니다.", user_id: "1", promote_store: "true", main_hidden: "true" ) #post id : 9
store2 = Bulletin.create( title: "가게 방문후기", content: "맛집탐방, 명소가게 후기", user_id: "1" ) #post id : 10

#구인구직
job_find1 = Bulletin.create( title: "일자리 : 구인", content: "일자리에 적합한 사람을 구하는 게시판", user_id: "1", search_job: "true" ) #post id : 11
job_find2 = Bulletin.create( title: "일자리 : 구직", content: "아르바이트 혹은 일자리 알아보는 게시판", user_id: "1", seeking_job: "true", main_hidden: "true" ) #post id : 12

#거래
room_sell = Bulletin.create( title: "복덕방", content: "방 정보 게시판", user_id: "1", info_room_trade: "true", main_hidden: "true" ) #post id : 13
room_find = Bulletin.create( title: "방 구해요", content: "학생들이 방을 구하는 게시판.", user_id: "1", seeking_room: "true", main_hidden: "true" ) #post id : 14
trade = Bulletin.create( title: "아나바다", content: "중고거래 게시판", user_id: "1", info_trade: "true" ) #post id : 15

#비공개 게시판
for_boss = Bulletin.create( title: "사장님 공지사항", content: "사장님들께 소식을 전해드리는 게시판.", user_id: "1",  main_hidden: "true", member_boss: "true" ) #post id : 16
for_boss = Bulletin.create( title: "학교 관계자 공지사항", content: "학교 관계자 분들께 소식을 전해드리는 게시판.", user_id: "1", main_hidden: "true", member_univ: "true" ) #post id : 17

request = Bulletin.create( title: "홈페이지 피드백 게시판", content: "홈페이지 피드백에 대해 남길 수 있는 게시판", main_hidden: "true", user_id: "1" ) #post id : 18