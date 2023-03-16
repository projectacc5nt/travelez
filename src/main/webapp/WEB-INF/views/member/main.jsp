<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<main>
    <div class="mainWrap">
        <div class="keyVisualBg">
            <div class="swiper mySwiper" id="swiper-myswiper-mainvisual">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="../asset/images/keyVisual1.jpg" alt="keyVisual1"></div>
                        <div class="swiper-slide"><img src="../asset/images/keyVisual2.jpg" alt="keyVisual2"></div>
                        <div class="swiper-slide"><img src="../asset/images/keyVisual3.jpg" alt="keyVisual3"></div>
                        <div class="swiper-slide"><img src="../asset/images/keyVisual4.jpg" alt="keyVisual4"></div>
                    </div>
                    <div class="swiper-pagination" id="swiper-pagination-mainvisual"></div>
             </div>
        </div>
        <div class="category">
            <a href="ta_bbslist.do?choice=title&search=호캉스" class="hotel">
                <img src="../asset/images/hotel.png" alt="hotel">
                <span>호캉스</span>
            </a>
            <a href="ta_bbslist.do?choice=title&search=펜션" class="hotel">
                <img src="../asset/images/pension.png" alt="pension">
                <span>펜션</span>
            </a>
            <a href="ta_bbslist.do?choice=title&search=캠핑" class="hotel">
                <img src="../asset/images/camping.png" alt="camping">
                <span>캠핑</span>
            </a>
            <a href="play.do?choice=title&search=전시" class="hotel">
                <img src="../asset/images/museum.png" alt="museum">
                <span>전시</span>
            </a>
            <a href="play.do?choice=title&search=핫플" class="hotel">
                <img src="../asset/images/place.png" alt="place">
                <span>핫플</span>
            </a>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">캠핑</p>
            <div class="cContent">
                <a href="ta_detail.do?seq=1" class="cBox" target="_blank">
                    <div><img src="../asset/images/cam1.jpg" alt="까사32"></div>
                    <p>가평 까사32 사계절 리버뷰 온수풀 수영장 펜션 리조트 객실</p>
                </a>
                <a href="ta_detail.do?seq=2" class="cBox" target="_blank">
                    <div><img src="../asset/images/cam2.jpg" alt="까망베르애견풀빌라"></div>
                    <p>가평펜션 까망베르애견풀빌라 강아지와 함께 갈 수 있는 펜션</p>
                </a>
                <a href="ta_detail.do?seq=3" class="cBox" target="_blank">
                    <div><img src="../asset/images/cam3.jpg" alt="청춘글램핑&카라반"></div>
                    <p>서울 근교 글램핑장 경기도 가평 청춘글램핑&카라반</p>
                </a>
                <a href="ta_detail.do?seq=4" class="cBox" target="_blank">
                    <div><img src="../asset/images/cam4.jpg" alt="세인트21"></div>
                    <p>가평 독채 풀빌라 펜션 세인트21에서 가족 힐링여행 딱 좋아</p>
                </a>
            </div>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">호캉스</p>
            <div class="cContent">
                <a href="ta_detail.do?seq=5" class="cBox" target="_blank">
                    <div><img src="../asset/images/hotelpool1.jpg" alt="네스트호텔"></div>
                    <p>인천공항과 가까운 nest hotel 네스트호텔 디럭스더블룸</p>
                </a>
                <a href="ta_detail.do?seq=6" class="cBox" target="_blank">
                    <div><img src="../asset/images/hotelpool2.jpg" alt="아일랜드 리솜"></div>
                    <p>안면도 아일랜드 리솜 일몰 예쁜 숙소 인피니트풀</p>
                </a>
                <a href="ta_detail.do?seq=7" class="cBox" target="_blank">
                    <div><img src="../asset/images/hotelpool3.jpg" alt="그랜드 하얏트 제주"></div>
                    <p>제주도 호캉스 추천 그랜드 하얏트 제주 호텔 수영장 38층 라운지 조식</p>
                </a>
                <a href="ta_detail.do?seq=8" class="cBox" target="_blank">
                    <div><img src="../asset/images/hotelpool1.jpg" alt="히든 클리프 호텔&네이쳐"></div>
                    <p>제주 히든 클리프 호텔&amp;네이쳐 호캉스 백배 즐기기</p>
                </a>
            </div>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">이번주 추천 놀거리</p>
            <div class="cContent">
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
            </div>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">여행꿀팁</p>
            <div class="cContent">
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
                <a href="#none" class="cBox" target="_blank">
                    <div><img src="../asset/images/testImg.jpg" alt=""></div>
                    <p>탁 트인 해변부터 낭만적인 야경코스까지 당일치기 드라이브6</p>
                </a>
            </div>
        </div>
</div>
</main>
<script>
    var swiper = new Swiper("#swiper-myswiper-mainvisual", {
        /* slidesPerView: 1, */
        autoHeight : true,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: "#swiper-pagination-mainvisual",
            clickable: true,
        },
        autoplay:{
            delay:3000, //1초(설정 안할 시 기본3초)
            disableOnInteraction:false //true일 경우 마우스가 올라가면 재생 일시정지
        },
    });
</script>