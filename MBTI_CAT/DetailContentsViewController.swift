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
        "Belinese"      :   " 발리니즈는 길고 날씬한 체형을 가지고 있는 고양이 입니다. 평균적으로 중장모를 소유한 묘종이고 다른 부위보다 꼬리의 털이 길게 나 있습니다.\n 우아하고 자연스러운 움직입과 꼬리의 긴 털의 흔들림이 발리의 전통 춤과 비슷하여 이름이 붙여지게 되었습니다. ",//발리니즈
        "Bombay"        :   " 봄베이는 다부진 체형에 단단한 골격을 가진 고양이입니다. 짧고 광택이 나는 털을 가지고 있으며 깊은 흑색의 피모를 가지고 있습니다. \n 봄베이는 특유의 걸음걸이를 가지고 있는데, 이 움직입에서 카리스마가 느껴져 마치 흑색 표범을 보는 느낌을 줍니다.", //봄베이
        "Egyptian Mau"  :   " 이집션 마우는 중형묘지만 길쭉한 체형과 매우 튼튼하고 건강한 고양이입니다. 큰 아몬드형 눈을 가지고 있으며 특유한 점무늬 패턴을 가지고 있습니다. \n 중모종에 속하며 윤기가 흐르고 부드러운 털과 꼬리에는 줄무늬가 있습니다.", // 이집션마우
        "Cymric"        :   " 킴릭은 전체적으로 동글동글하게 생긴 고양이 입니다. 수엽이 있는 양쪽 볼은 볼록하게 나와 있습니다. 앞다리보다 뒷다리가 더 길어 독특한 걸음걸이를 가지고 있고, 긴 털에 이중모를 가지고 있어 두껍고 밀도가 높습니다. \n 킴릭은 꼬리가 완전히 없거나 매우 짧은 꼬리를 가지고 있습니다.", //    킴릭
        "American Curl" :   " 아메리칸 컬은 크지는 않지만 근육이 잘 발달되어 있고 중형 크기의 뼈를 가지고 있습니다. 아메리칸 컬의 뚜렷한 특징은 귀 입니다. 뒤 방향으로 곱슬거리는 귀를 가지고 있으며 적어도 90도 정도의 호 모양으로 구부러져 있습니다. \n 단모 또는 중모를 가지고 있으며 비단처럼 부드럽습니다.", //    아메리칸컬
        "Abyssinian"    :   "", //    아비시안
        "Bengal"        :   "", //    뱅갈
        "Ragdoll"       :   "", //    렉돌
        "Maine Coon"    :   "", //    메인쿤
        "Exotic"        :   "", //    엑조틱
        "American Short":   "", //    아메리칸숏
        "Persian"       :   "", //    페르시안
        "Burmilla"      :   "", //    버밀라(x)
        "Norwegian forest": "", //    노르웨이숲
        "British Short" :   "", //    브리티시 숏
        "Himalayan"     :   "", //    히말라얀(x)
        "Scottish Fold" :   "", //    스코티시 폴드
        "Siamese"       :   "", //    샴(x)
        "Turkish angora":   "", //    터키시 앙고라
        "Cornish Rex"   :   "", //    코니시 렉스
        "Japanese Bobtail": "", //    재패지즈 밥테일
        "Javanese"      :   "", //    자바니즈(x)
        "Burmese"       :   "", //    버미즈
        "Chantilly"     :   "", //    샹틀리(X)
        "Birman"        :   "", //    버만
        
        
    ]

    var CatPers : Dictionary = [
        "Belinese"      :   " 발리니즈는 활동적이고 매우 영리하며 호기심이 많습니다. 흔히 말하는 무릎냥이인 만큼 사교성이 좋고 사람들 옆에 있는것을 좋아합니다. 다소 시끄럼게 우는 고양이 입니다.", // 발리니즈
        "Bombay"        :   " 봄베이는 활동적이고 호기심이 많습니다. 그리고 튼튼한 골격으로 힘이 매우 좋습니다. 가족들의 관심과 사람을 좋아하며 변화에 쉽게 적응하는 고양이 입니다. \n 성묘가 되면 주변에 관찰하는 것을 즐깁니다.", //봄베이
        "Egyptian Mau"  :   " 이집션 마우는 높은 곳에 올라가 주위를 관찰하는 것을 좋아합니다. 매우 활동적이지만  낯선 대상을 꺼려합니다. 높은 곳에 자신만의 영역을 만들고 혼자 있기를 좋아합니다.", // 이집션마우
        "Cymric"        :   " 킴릭은 온순하고 상냥한 고양이 입니다. 어떤 것에도 쉽게 예민해 지지 않고 사람들과 같이 있는것을 좋아하는 사랑스러운 고양이 입니다. 얌전하지만 뛰어 노는 것을 좋아하고 영리합니다.", //    킴릭
        "American Curl" :   " 아메리칸 컬은 매우 활기찬 고양이로 매일 운동하는 것을 좋아합니다. 점프와 기어오르기를 즐깁니다. 사람들에게 관심이 많고 가족과도 잘 지내며 옆에 있는것을 좋아합니다.", //    아메리칸컬
        "Abyssinian"    :   "", //    아비시안
        "Bengal"        :   "", //    뱅갈
        "Ragdoll"       :   "", //    렉돌
        "Maine Coon"    :   "", //    메인쿤
        "Exotic"        :   "", //    엑조틱
        "American Short":   "", //    아메리칸숏
        "Persian"       :   "", //    페르시안
        "Burmilla"      :   "", //    버밀라(x)
        "Norwegian forest": "", //    노르웨이숲
        "British Short" :   "", //    브리티시 숏
        "Himalayan"     :   "", //    히말라얀(x)
        "Scottish Fold" :   "", //    스코티시 폴드
        "Siamese"       :   "", //    샴(x)
        "Turkish angora":   "", //    터키시 앙고라
        "Cornish Rex"   :   "", //    코니시 렉스
        "Japanese Bobtail": "", //    재패지즈 밥테일
        "Javanese"      :   "", //    자바니즈(x)
        "Burmese"       :   "", //    버미즈
        "Chantilly"     :   "", //    샹틀리(X)
        "Birman"        :   "", //    버만
        
        
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
    }
    

    
   
   
    
    @IBAction func onBtnGoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
