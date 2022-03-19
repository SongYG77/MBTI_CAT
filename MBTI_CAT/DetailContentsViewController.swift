//
//  DetailContentsViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/24.
//

// 특징 자세히 보기,
// 데이터를 어떻게 넘길지도 생각해야함
import UIKit

class DetailContentsViewController: UIViewController {
    
    
    @IBOutlet weak var CatNameTitle_Label: UILabel!
    @IBOutlet weak var CatImg_Image: UIImageView!
    @IBOutlet weak var CatShort_TV: UITextView!
    
    @IBOutlet weak var CatPersTitle_Label: UILabel!
    @IBOutlet weak var CatPersText_TV: UITextView!
    
    
    
    @IBOutlet weak var CharaticTitle_Label: UILabel!
    @IBOutlet weak var CharaticText_TV: UITextView!
    
    @IBOutlet weak var BackButton1: UIButton!
    @IBOutlet weak var BackButton2: UIButton!
    
    
    var CatKinds : String = ""
    
    
    var Charatic : Dictionary = [
        "Belinese"      :   " 발리니즈는 길고 날씬한 체형을 가지고 있는 고양이입니다. 평균적으로 중장모를 소유한 묘종이고 다른 부위보다 꼬리의 털이 길게 나 있습니다.\n 우아하고 자연스러운 움직입과 꼬리의 긴 털의 흔들림이 발리의 전통 춤과 비슷하여 이름이 붙여지게 되었습니다. ",//발리니즈
        "Bombay"        :   " 봄베이는 다부진 체형에 단단한 골격을 가진 고양이입니다. 짧고 광택이 나는 털을 가지고 있으며 깊은 흑색의 피모를 가지고 있습니다. \n 봄베이는 특유의 걸음걸이를 가지고 있는데, 이 움직입에서 카리스마가 느껴져 마치 흑색 표범을 보는 느낌을 줍니다.", //봄베이
        "Egyptian Mau"  :   " 이집션 마우는 중형묘지만 길쭉한 체형과 매우 튼튼하고 건강한 고양이입니다. 큰 아몬드형 눈을 가지고 있으며 특유한 점무늬 패턴을 가지고 있습니다. \n 중모종에 속하며 윤기가 흐르고 부드러운 털과 꼬리에는 줄무늬가 있습니다.", // 이집션마우
        "Cymric"        :   " 킴릭은 전체적으로 동글동글하게 생긴 고양이입니다. 수엽이 있는 양쪽 볼은 볼록하게 나와 있습니다. 앞다리보다 뒷다리가 더 길어 독특한 걸음걸이를 가지고 있고, 긴 털에 이중모를 가지고 있어 두껍고 밀도가 높습니다. \n 킴릭은 꼬리가 완전히 없거나 매우 짧은 꼬리를 가지고 있습니다.", //    킴릭
        "American Curl" :   " 아메리칸 컬은 크지는 않지만 근육이 잘 발달되어 있고 중형 크기의 뼈를 가지고 있습니다. 아메리칸 컬의 뚜렷한 특징은 귀 입니다. 뒤 방향으로 곱슬거리는 귀를 가지고 있으며 적어도 90도 정도의 호 모양으로 구부러져 있습니다. \n 단모 또는 중모를 가지고 있으며 비단처럼 부드럽습니다.", //    아메리칸컬
        "Abyssinian"    :   " 아비니시안은 모든 면에서 평번한 외형을 가지는 고양이입니다. 비교적 큰 귀를 가지고 있으며, 앞쪽으로 경사져 항상 모든것에 관심을 가지는 것 처럼 보입니다. 긴 몸통에 근육이 잘 발달되어 있습니다. \n 짧은 털을 가지고 있으며 풍부하고 다양한 색채를 띠고 있고, 척추선에 따라 어두운 색을 띕니다. ", //    아비시안
        "Bengal"        :   " 뱅갈은 대형묘로 몸집에 비해 뼈대가 가벼울 수 있지만 탄탄한 근육을 가지고 있습니다. 모든 신체 부위가 큼직큼직하게 생겼습니다. 갈색 점 무늬를 가지고 이 무늬는 일렬로 이루어진 것이 아니라 랜덤한 형태를 띄고 있습니다. \n 뱅갈의 털은 짧고 거칠게 느껴질 수 있습니다. ", //    뱅갈
        "Ragdoll"       :   "렉돌은 크고 긴 골격과 긴꼬리를 가지고 있습니다. 다리도 길고 강하며 눈은 청색을 띄고 있습니다. 렉돌의 색상은 고유한 패턴을 가집니다. 귀와 눈 주변부, 입주변등 어두운 색을 띄고 이와 대비되는 밝은 색의 몸통을 가집니다. \n 렉돌의 피모 길이는 다양하며 부드럽과 화려한 광택을 가집니다.", //    렉돌
        "Maine Coon"    :   "메인쿤은 무거운 골격을 가진 대형묘입니다. 큰 고양이로 유명하며 몸통가 꼬리의 길이가 깁니다. 메인쿤의 털은 무겁고 윤기가 흐릅니다. 피모는 배와 다리 뒤쪽으로 아름다운 주름을 형성하고 어깨에서 짧아집니다. ", //    메인쿤
        "Exotic"        :   " 엑조틱은 몸통은 짧지만 매우 두꺼운 다리를 가지고 짧고 두꺼운 목을 가진 고양이입니다. 골격이 두껍지만 짧은 꼬리와 귀를 가지고 있습니다. 전체적으로 얼굴은 평평합니다. 엑조틱의 털은 두껍고 화려하며 내부털이 매우 두꺼워 부풀어올라 보일 수 있습니다.", //    엑조틱
        "American Short":   " 아메리칸 숏헤어는 힘이 좋은 고양이입니다. 모든 근육이 발달되어 있으며 넒은 가슴과 강인한 목과 턱을 가지고 있습니다. 피모는 두껍고 조밀합니다. 겨울이 되면 더 두꺼워지고, 털은 스스로 보호한다는 용도로 상대적으로 단단합니다. ", //    아메리칸숏
        "Persian"       :   " 페르시안은 개성 넘치는 외모를 가진 고양이입니다. 몸통은 짧지만 두껍고 다리와 목도 두껍습니다. 꼬리와 귀도 작습니다. 얼굴은 동글동글하고 납작한 형태입니다. \n 페르시안의 피모는 얇고 긴 것이 특징입니다. 결도 고운편이며 윤기가 납니다.", //    페르시안
        "Burmilla"      :   " 버밀라는 동글동글한 고양이입니다. 중형묘지만 단단하고 무거우며, 상당한 근육을 가지고 있습니다. 버밀라의 피모는 짧고 부드러우며, 두껍고 조밀한 형태를 가집니다.", //    버밀라(x)
        "Norwegian forest": " 노르웨이숲은 크고 굵은 뼈대를 가진 사냥꾼 본능이 뛰어난 고양이입니다. 털이 촘촘하고 빽빽하며 이중모 모두 두껍고 깁니다. 그래서 이러한 털이 몸집을 더 커보이게 합니다. 풍성한 털이 노르웨이의 숲 생활에 보호하도록 자연방어막이 되어 주었습니다.", //    노르웨이숲
        "British Short" :   " 브리티시 숏헤어는 강인한 고양이로 모든 면이 발달되었습니다. 큰 근육과 무거운 골격을 가지고 있습니다. 다리도 두껍고 강하며, 털 역시 두껍고 조밀하여 단단합니다. 전체적인 외형은 둥근 형태를 가지고 있습니다.", //    브리티시 숏
        "Himalayan"     :   " 히말라얀은 페르시안 고양이와 비슷한 형태를 가지고 있습니다. 몸통과 목은 짧지만 두껍고 다리 역시 두껍습니다. 골격은 무겁지만 꼬리와 귀는 짧습니다. 얼굴은 둥글고 평평한 형태입니다. \n 히말라얀의 털은 많고 길며 빽빽하지만 얆고 광택이 납니다.", //    히말라얀(x)
        "Scottish Fold" :   " 스코티시 폴드는 동그란 머리에 접혀있는 귀로 인해 동글동글한 형태를 가집니다. 눈도 동그란 모양에 선명합니다. 다리와 꼬리도 짧아 전체적으로 둥근 느낌을 줍니다.\n 긴 털을 가진 종도 있는데 질감이 다양하고 관리가 필요합니다.", //    스코티시 폴드
        "Siamese"       :   " 샴은 다리와 꼬리, 몸이 긴 우아한 고양이입니다. 짧은 피모를 가지고 광택이 납니다. 매끈한 몸과 밝은 몸통색상과 이에 대조되는 어더운 끝부분이 아름다운 고양이입니다. 귀와 꼬리, 다리와 얼굴부분에 포인트로 어두운 색상을 띄고 이는 새끼때는 작다가 성장하며 넓어집니다.", //    샴(x)
        "Turkish angora":   " 터키시 앙고라는 가는 뼈대에 가늘고 긴 몸통을 가지고 있습니다. 하지만 탄탄한 근육을 가진 고양이입니다. 뒷다리가 앞다리보다 길며 우아한 몸놀림과 도도함한 분위기를 풍깁니다. 속털이 없고 중장모에 부드러운 털을 가지고 있어 부드러운 움직입니 더 돋보입니다.", //    터키시 앙고라
        "Cornish Rex"   :   " 코니시 렉스는 소형에서 중형묘로 마른 골격을 가진 고양이입니다. 작은 머리에 비해 큰 눈과 귀를 가지고 있습니다. 코니시 렉스는 매우 독특한 피모를 가지고 있습니다. 윤이나고 부드럽지만 땋은 머리처럼 웨이브를 형성하고 있습니다.", //    코니시 렉스
        "Japanese Bobtail": " 재패니즈 밥테일은 길고 말랐지만 탄탄한 근육을 가진 고양이입니다. 뒷다리가 앞다리보다 길지만 몸은 지면과 평행을 유지합니다. 선천적으로 짧고 구부러진 꼬리를 가지는데 이는 고양이마다 다 다른 모습을 가집니다. 털은 속털이 없고 부드럽습니다. ", //    재패지즈 밥테일
        "Javanese"      :   " 자바니즈는 중형묘로 뼈가 얇지만 근육이 발달된 고양이입니다. 녹색의 짙은 눈을 가졌는데 이는 깊고 강렬한 느낌을 줍니다. 털은 길지 않으며 매우 부드럽과 광이 나며 속털이 없습니다. 반점이 얼굴 띠와 거북이 등 패턴을 가지고 있습니다.", //    자바니즈(x)
        "Burmese"       :   " 버미즈는 중형묘지만 다부진 체형과 단단한 골격을 가지고 있습니다. 전체적으로 동글동글한 느낌을 주며 머리와 귀는 물론 눈과 턱, 발까지 둥급니다. 보기에도 단단해 보이고 굉장한 파워를 가지고 있습니다. 털은 짧고 윤기가 흐릅니다. ", //    버미즈
        "Chantilly"     :   " 샹틀리는 중형묘에 부드러운 외모를 가지고 있습니다. 황금색의 눈을 가지고 있으며 나이가 들 수록 색상이 깊어집니다. 장모종이지만 속털이 거의 없습니다. 그리고 부드럽고 매끄러운 털을 가지고 있습니다.", //    샹틀리(X)
        "Birman"        :   " 버만은 체형이 길고 큰 고양이입니다. 버만은 매우 독특한 무늬를 가지고 있습니다. 하얀 네 발과 짙은 사파이어 눈을 가진 고양이입니다. 튼튼하고 넓은 골격에 전체적으로 다부진 모습을 하고 있습니다. 중장모의 털을 가지고 있으며 잘 엉키지 않습니다.", //    버만
        
        
    ]

    
    var CatPers : Dictionary = [
        "Belinese"      :   " 발리니즈는 활동적이고 매우 영리하며 호기심이 많습니다. 흔히 말하는 무릎냥이인 만큼 사교성이 좋고 사람들 옆에 있는것을 좋아합니다. 다소 시끄럼게 우는 고양이 입니다.", // 발리니즈
        "Bombay"        :   " 봄베이는 활동적이고 호기심이 많습니다. 그리고 튼튼한 골격으로 힘이 매우 좋습니다. 가족들의 관심과 사람을 좋아하며 변화에 쉽게 적응하는 고양이 입니다. \n 성묘가 되면 주변에 관찰하는 것을 즐깁니다.", //봄베이
        "Egyptian Mau"  :   " 이집션 마우는 높은 곳에 올라가 주위를 관찰하는 것을 좋아합니다. 매우 활동적이지만  낯선 대상을 꺼려합니다. 높은 곳에 자신만의 영역을 만들고 혼자 있기를 좋아합니다.", // 이집션마우
        "Cymric"        :   " 킴릭은 온순하고 상냥한 고양이 입니다. 어떤 것에도 쉽게 예민해 지지 않고 사람들과 같이 있는것을 좋아하는 사랑스러운 고양이 입니다. 얌전하지만 뛰어 노는 것을 좋아하고 영리합니다.", //    킴릭
        "American Curl" :   " 아메리칸 컬은 매우 활기찬 고양이로 매일 운동하는 것을 좋아합니다. 점프와 기어오르기를 즐깁니다. 사람들에게 관심이 많고 가족과도 잘 지내며 옆에 있는것을 좋아합니다.", //    아메리칸컬
        "Abyssinian"    :   " 아비시니안은 활동적이지만 집에서 기르기 좋은 고양이입니다. 사람뿐만 아니라 다른 동물과도 잘 지내고, 가족들과 함께하는 놀이를 좋아합니다. 부드럽고 조용한 소리로 가족들에게 말을 걸어옵니다.", //    아비시안
        "Bengal"        :   " 뱅갈은 야생 고양이와 매우 흡사하게 생겼지만, 매우 상냥하고 사랑스러운 고양이 입니다. 사람들과 친근하게 지내며 충성심이 강하고, 매우 영리한 고양이입니다. 자유로운 운동과 그루밍을 좋아하여 스스로 관리를 잘 합니다.", //    뱅갈
        "Ragdoll"       :   " 렉돌은 온화하고 상냥한 고양이입니다. 분쟁을 싫어하고 모든 가족들과 잘 지냅니다. 특별하게 큰 사고를 치지 않지만 안는것을 싫어합니다. 그리고 일상의 변화에 대해 민감하지 않습니다. ", //    렉돌
        "Maine Coon"    :   " 메인쿤은 젠틀 자이언트라는 별명을 가지고 있습니다. 큰 몸집을 가졌지만 온순하고 부드럽습니다. 약간의 운동공간만 주어진다면 어떤 환경에서든 잘 적응합니다. 평소에 작은 소리를 내지만 운동할때 큰소리를 냅니다. ", //    메인쿤
        "Exotic"        :   " 엑조틱은 새끼고양이같은 행동을 합니다. 조용하지만 갑자기 분주하게 뛰어다니거나 구르곤 합니다. 주인의 무릎에 올라가거나 주변에서 기지개를 피는 등 주인과 친근하지만 낯선 대상을 경계합니다.", //    엑조틱
        "American Short":   " 아메리칸 숏헤어는 매우 유쾌한 고양이입니다. 영리하고 온순하며 가족들에게 애착을 가집니다. 그렇지만 혼자 있는 상황에 민감하지 않습니다. 스스로 놀고싶으면 장난감을 찾아 놀거나 주인에게 가져다 줍니다. ", //    아메리칸숏
        "Persian"       :   " 페르시안은 새끼고양이의 활동성을 보여주는 고양이입니다. 온순하며 가족에게 다가와 잠을 자거나 무릎위에 올라옵니다. 보통 모든 사람들과 친하게 지내며 일상변화에 신경쓰지 않습니다. 다만 활동력이 좋지 못해 관리가 필요합니다.", //    페르시안
        "Burmilla"      :   " 버밀라는 매우 침착한 고양이입니다. 애정이 많고 매우 사랑스러운 고양이입니다. 차분하고 주인의 애정을 좋아하여 좋은 동료가 될 수 있는 고양이입니다.", //    버밀라(x)
        "Norwegian forest": " 노르웨이 숲은 상냥하고 사랑스러운 고양이입니다. 칭찬을 좋아하고 가족과 상호작용을 좋아합니다. 야생의 본능이 남아있어 추격하는 놀이를 좋아하고 자신만의 공간을 좋아합니다. 또 필요하다고 느끼면 운동량과 음식섭취를 조절하는 스스로 관리하는 고양이입니다.", //    노르웨이숲
        "British Short" :   " 브리티시 숏헤어는 매우 유쾌한 고양이입니다. 까다롭지 않고 조용하며 주인에게 충성심이 강한 고양이입니다. 가족들과 잘 지내며 혼자서도 잘 놀고, 누군가 놀고싶을 땐 장난감을 물어옵니다.", //    브리티시 숏
        "Himalayan"     :   " 히말라얀은 새끼고양이의 활동성을 보여주는 고양이입니다. 온순하며 가족에게 다가와 잠을 자거나 무릎위에 올라옵니다. 보통 모든 사람들과 친하게 지내며 일상변화에 신경쓰지 않습니다. 다만 활동력이 좋지 못해 관리가 필요합니다.", //    히말라얀(x)
        "Scottish Fold" :   " 스코티시 폴드는 돌보기 수월하고 함께 생활하는데 어려움이 없는 사랑스러운 고양이입니다. 모든 가족과 스스럼없이 잘 지냅니다. 다만 활동적이지 않아 영양섭취와 가족들과의 상호작용 놀이로 관리가 필요합니다.", //    스코티시 폴드
        "Siamese"       :   " 샴은 매우 영리한 고양이입니다. 훈련을 통해 줄위를 걸을 수도 있습니다. 하지만 영리한 품종인 만큼 고집이 있어 모든것이 가능한건 아닙니다. 애정이 많고 엄청난 무릎냥이지만 주인에게 하는 만큼 주인도 자신에게 헌신하고 애정을 주기 원합니다.", //    샴(x)
        "Turkish angora":   " 터키시 앙고라는 상냥하지만 갑작스러운 변화에 예민해 질 수 있습니다. 성격은 조용한 편이지만 충성심이 강하고 활발하게 뛰어 노는것을 좋아합니다. 그리고 다양한 장난감들을 좋아하고 활동적이라 적당한 높이의 창틀이나 캣트리를 좋아합니다.", //    터키시 앙고라
        "Cornish Rex"   :   " 코니시 렉스는 주인에 대해 상당한 애착을 가집니다. 주인 옆에 있기를 좋아하고 손길을 좋아합니다. 장난기도 많고 매우 활동적이여서 아기 고양이 같은 익살스러운 행동을 합니다. 놀이에서는 전혀 지치지 않는 것처럼 보이기도 합니다.", //    코니시 렉스
        "Japanese Bobtail": " 재패니즈 밥테일은 매우 활동적이고 영리한 고양이입니다. 사람들과 같이 있는것을 좋아하며 끝없이 함께 노는것을 좋아합니다. 자기의 이름을 알아듣고 사회적이며, 집안에 두려워하는 것 없이 마치 주인처럼 전체를 지배합니다.", //    재패지즈 밥테일
        "Javanese"      :   " 자바니즈는 매우 활동적이고 수다스러운 고양이입니다. 소리를 많이 내며 높이 뛰는것을 매우 잘합니다. 그래서 만약 높은 창틀 쇼파나 캣트리가 없다면 높이 있는 물건을 자신의 캣트리로 만들 것입니다. ", //    자바니즈(x)
        "Burmese"       :   " 버미즈는 호기심이 많은 고양이입니다. 새끼때는 활동적이지만 성묘가 되면 차분하고 주변을 관찰하는 것을 좋아합니다. 다른 품종의 고양이와 잘 지내는 편은 아닙니다. 주변을 이곳저곳 둘러보는 것을 좋아하고 전망이 잘보이는 창가를 좋아합니다.", //    버미즈
        "Chantilly"     :   " 샹틀리는 헌신적인 동반자입니다. 혼자있기보단 다른 사람과 같이 있는것을 좋아합니다. 필요한 것이나 특별한 일이 없더라도 대화하는 것처럼 재잘거리며 이야기합니다. 상당히 따듯하고 상냥한 고양이입니다.", //    샹틀리(X)
        "Birman"        :   " 버만은 조용하고 낯을 가리며 한 사람에게 애착을 가지는 고양이입니다. 상당히 느긋하고 침착하지만 질투심과 텃세본능을 가지고 있습니다. 그래도 공격적으로 대하지는 않습니다. ", //    버만
        
    ]
    
    var CatNickname : Dictionary = [
                "Belinese"      :   "발리 댄서 고양이", //    발리니즈
                "Bombay"        :   "검은 고양이 네로", //    봄베이
                "Egyptian Mau"  :   "도도한 이집트 고양이", //    이집션마우
                "Cymric"        :   "토끼 고양이", //    킴릭 (x)
                "American Curl" :   "초승달 귀 고양이", //    아메리칸컬
                "Abyssinian"    :   "사막여우 고양이", //    아비시안
                "Bengal"        :   "상냥한 맹수 고양이", //    뱅갈
                "Ragdoll"       :   "인형 같은 고양이", //    렉돌
                "Maine Coon"    :   "젠틀 자이언트 고양이", //    메인쿤
                "Exotic"        :   "파자마를 입은 페르시안", //    엑조틱
                "American Short":   "동글동글 귀여운 고양이", //    아메리칸숏
                "Persian"       :   "귀부인 고양이", //    페르시안
                "Burmilla"      :   "아름다운 고양이", //    버밀라(x)
                "Norwegian forest": "관리하는 고양이", //    노르웨이숲
                "British Short" :   "유쾌한 고양이", //    브리티시 숏
                "Himalayan"     :   "온순한 고양이", //    히말라얀(x)
                "Scottish Fold" :   "동글동글한 고양이", //    스코티시 폴드
                "Siamese"       :   "고양이의 여왕", //    샴(x)
                "Turkish angora":   "새하얀 고양이", //    터키시 앙고라
                "Cornish Rex"   :   "곱슬곱슬 고양이", //    코니시 렉스
                "Japanese Bobtail": "영리한 고양이", //    재패지즈 밥테일
                "Javanese"      :   "헌신적인 고양이", //    자바니즈(x)
                "Burmese"       :   "행운을 주는 고양이", //    버미즈
                "Chantilly"     :   "수다쟁이 고양이", //    샹틀리(X)
                "Birman"        :   "양말 고양이", //    버만
    
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CatImg_Image.image = UIImage(named: CatKinds + ".png")

        CatNameTitle_Label.text = CatKinds
        CatNameTitle_Label.clipsToBounds = true
        CatNameTitle_Label.layer.cornerRadius = 15
        CatNameTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CatImg_Image.layer.borderWidth = 2
        CatImg_Image.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CatImg_Image.layer.cornerRadius = 0
        CatImg_Image.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CatImg_Image.clipsToBounds = true
        
        CatShort_TV.layer.borderWidth = 2
        CatShort_TV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CatShort_TV.layer.cornerRadius = 15
        CatShort_TV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CatShort_TV.clipsToBounds = true
        
        CatPersTitle_Label.clipsToBounds = true
        CatPersTitle_Label.layer.cornerRadius = 15
        CatPersTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CatPersText_TV.layer.borderWidth = 2
        CatPersText_TV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CatPersText_TV.layer.cornerRadius = 15
        CatPersText_TV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CatPersText_TV.clipsToBounds = true
        
        CharaticTitle_Label.clipsToBounds = true
        CharaticTitle_Label.layer.cornerRadius = 15
        CharaticTitle_Label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CharaticText_TV.layer.borderWidth = 2
        CharaticText_TV.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        CharaticText_TV.layer.cornerRadius = 15
        CharaticText_TV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        CharaticText_TV.clipsToBounds = true
        
        BackButton2.layer.borderWidth = 2
        BackButton2.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton2.layer.cornerRadius = 15
        BackButton2.clipsToBounds = true
        
        BackButton1.layer.borderWidth = 2
        BackButton1.layer.borderColor = UIColor(displayP3Red: 249/255, green: 212/255, blue: 153/255, alpha: 1).cgColor
        BackButton1.layer.cornerRadius = 10
        BackButton1.clipsToBounds = true
        
        print(CatKinds)
        
        CatPersText_TV.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        CharaticText_TV.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        CatPersText_TV.text = CatPers[CatKinds]
        CharaticText_TV.text = Charatic[CatKinds]
        CatShort_TV.text = CatNickname[CatKinds]
    }
    

    
   
   
    
    @IBAction func onBtnGoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
