// ignore_for_file: lines_longer_than_80_chars

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

/// 이모지 카테고리 목록 (한국어)
const List<CategoryEmoji> emojiSetKorean = [
// ======================================================= Category.SMILEYS
  CategoryEmoji(Category.SMILEYS, [
    Emoji(
      '😀',
      '밝은 | 유쾌한 | 얼굴 | 웃음 | 웃음 | 행복 | 웃음 | 좋은 | 미소 | 미소 | 치아',
    ),
    Emoji(
      '😃',
      '최고 | 큰 | 눈 | 얼굴 | 웃음 | 웃음 | 행복 | 입 | 열린 | 미소 | 미소 | 치아 | 야호',
    ),
    Emoji(
      '😄',
      '눈 | 눈 | 얼굴 | 웃음 | 웃음 | 행복 | 웃음 | 롤 | 입 | 열린 | 미소 | 미소',
    ),
    Emoji(
      '😁',
      '환한 | 눈 | 눈 | 얼굴 | 웃음 | 웃음 | 행복 | 좋은 | 미소 | 미소 | 치아',
    ),
    Emoji(
      '😆',
      '감은 | 눈 | 얼굴 | 웃음 | 하하 | 하하하 | 행복 | 웃음 | 롤 | 입 | 열린 | 롤 | 미소 | 미소 | 눈 찌푸린',
    ),
    Emoji(
      '😅',
      '추운 | 낙담 | 신남 | 얼굴 | 웃음 | 입 | 긴장 | 열린 | 미소 | 미소 | 스트레스 | 스트레스 | 땀',
    ),
    Emoji(
      '🤣',
      '울음 | 얼굴 | 바닥 | 웃긴 | 하하 | 행복 | 히히 | 폭소 | 기쁨 | 웃음 | 롤 | 롤 | 롤 | 롤 | 굴러 | 눈물',
    ),
    Emoji(
      '😂',
      '울음 | 얼굴 | 감동 | 웃긴 | 하하 | 행복 | 히히 | 폭소 | 기쁨 | 웃음 | 롤 | 롤 | 롤 | 롤 | 눈물',
    ),
    Emoji(
      '🙂',
      '얼굴 | 행복 | 살짝 | 미소 | 미소',
    ),
    Emoji(
      '🙃',
      '얼굴 | 히히 | 미소 | 거꾸로',
    ),
    Emoji(
      '😉',
      '얼굴 | 설렘 | 이별 | 섹시 | 슬라이드 | 농담 | 윙크 | 윙크 | 윙크',
    ),
    Emoji(
      '😊',
      '부끄 | 눈 | 눈 | 얼굴 | 기쁜 | 만족 | 미소 | 미소',
    ),
    Emoji(
      '😇',
      '천사 | 천사 | 천사 | 축복 | 얼굴 | 요정 | 동화 | 판타지 | 후광 | 행복 | 순수 | 평화 | 미소 | 미소 | 영혼 | 이야기',
    ),
    Emoji(
      '🥰',
      '3 | 좋아해 | 짝사랑 | 얼굴 | 하트 | 하트 | 사랑해 | 사랑 | 로맨스 | 미소 | 미소 | 당신',
    ),
    Emoji(
      '😍',
      '143 | 베프 | 눈 | 얼굴 | 감동 | 하트눈 | 하트 | 사랑해 | 키스 | 사랑 | 로맨스 | 로맨틱 | 미소 | 뽀뽀',
    ),
    Emoji(
      '🤩',
      '신남 | 눈 | 얼굴 | 웃음 | 미소 | 별 | 반함 | 별 눈 | 와우',
    ),
    Emoji(
      '😘',
      '귀여워 | 베프 | 보내는 | 얼굴 | 설렘 | 하트 | 사랑해 | 키스 | 사랑 | 연인 | 보고싶어 | 뽀뽀 | 로맨틱 | 뽀뽀 | 뽀뽀 | 당신',
    ),
    Emoji(
      '😗',
      '143 | 데이트 | 데이트 | 얼굴 | 설렘 | 사랑해 | 키스 | 사랑 | 뽀뽀 | 뽀뽀 | 뽀뽀 | 당신',
    ),
    Emoji(
      '☺️',
      '얼굴 | 행복 | 윤곽 | 편안 | 미소 | 미소',
    ),
    Emoji(
      '😚',
      '143 | 베프 | 부끄 | 감은 | 데이트 | 데이트 | 눈 | 눈 | 얼굴 | 설렘 | 사랑해 | 키스 | 키스 | 뽀뽀 | 뽀뽀',
    ),
    Emoji(
      '😙',
      '143 | 감은 | 데이트 | 데이트 | 눈 | 눈 | 얼굴 | 설렘 | 사랑해 | 키스 | 키스 | 키스 | 사랑 | 밤 | 미소 | 미소',
    ),
    Emoji(
      '😋',
      '맛있는 | 먹다 | 얼굴 | 음식 | 배부른 | 배고픈 | 맛 | 미소 | 미소 | 맛있는 | um | 맛 | 맛있어',
    ),
    Emoji(
      '😛',
      '최고 | 쿨 | 얼굴 | 좋은 | 파티 | 내민 | 달콤 | 혀',
    ),
    Emoji(
      '😜',
      '미친 | 대박 | 눈 | 얼굴 | 웃긴 | 농담 | loopy | 장난 | 파티 | 내민 | 혀 | 엉뚱 | 이상한 | 윙크 | 윙크 | yolo',
    ),
    Emoji(
      '🤪',
      '미친 | 눈 | 눈 | 얼굴 | 엉뚱 | 큰 | 작은 | 장난',
    ),
    Emoji(
      '😝',
      '감은 | 눈 | 눈 | 얼굴 | 역겨운 | 끔찍 | 오마이갓 | 눈 찌푸린 | 내민 | 맛 | 혀 | 뭐든 | yolo',
    ),
    Emoji(
      '🤑',
      '얼굴 | 돈 | 돈 | 입 | 받은',
    ),
    Emoji(
      '🤗',
      '얼굴 | 손 | 포옹 | 포옹 | 열린 | 미소',
    ),
    Emoji(
      '🫣',
      '넋놓은 | 부끄 | 눈 | 얼굴 | 숨기기 | 숨는 | 엿보기 | 엿보는 | 엿보기 | 겁먹은 | 수줍은 | 쳐다보기',
    ),
    Emoji(
      '🤭',
      '얼굴 | 킥킥 | 킥킥 | 손 | 입 | 앗 | 깨달음 | 비밀 | 충격 | 갑작스런 | 놀람 | 앗',
    ),
    Emoji(
      '🫢',
      '놀람 | 경외 | 불신 | 부끄 | 눈 | 얼굴 | 헉 | 손 | 입 | 오마이갓 | 열린 | 넘치는 | 조용 | 겁먹은 | 충격 | 놀람',
    ),
    Emoji(
      '🫡',
      '얼굴 | 좋은 | 행운 | ma’am | 오케이 | 존중 | 경례 | 경례 | 님 | 군대 | 네',
    ),
    Emoji(
      '🤫',
      '얼굴 | 조용 | 쉿 | 쉿 | 쉿',
    ),
    Emoji(
      '🫠',
      '사라짐 | 녹음 | 부끄 | 얼굴 | 하하 | 더위 | 더운 | 액체 | 롤 | 녹다 | 녹는 | 비꼼 | 비꼼',
    ),
    Emoji(
      '🤔',
      '턱 | 생각 | 얼굴 | 음 | 고민 | 고민 | 생각 | 궁금',
    ),
    Emoji(
      '🤐',
      '얼굴 | 유지 | 입 | 조용 | 비밀 | 닫은 | 지퍼 | 지퍼 | zipper-mouth',
    ),
    Emoji(
      '🤨',
      '불찬성 | 불신 | 불신 | 이모지 | 눈썹 | 얼굴 | 음 | 가벼운 | 든 | 회의적 | 의심 | 회의 | 놀람 | 뭐',
    ),
    Emoji(
      '😐',
      '어색 | 멍한 | 무표정 | 무표정 | 얼굴 | 괜찮은 | 질투 | 에휴 | 중립 | 오 | 쉐이드 | 똑바른 | 시큰둥 | 슬픈 | 안 감동 | 뭐든',
    ),
    Emoji(
      '🫤',
      '혼란 | 혼란 | 비스듬 | 실망 | 의심 | 의심 | 얼굴 | 좌절 | 좌절 | 에휴 | 입 | 의심 | 불확실 | 뭐든 | 뭐든',
    ),
    Emoji(
      '😑',
      '어색 | 죽은 | 무표정 | 얼굴 | 괜찮은 | 무표정 | 질투 | 에휴 | 안 | 오 | 오마이갓 | 똑바른 | 어 | 슬픈 | 안 감동 | 뭐든',
    ),
    Emoji(
      '😶',
      '어색 | 멍한 | 무표정 | 얼굴 | 입 | 입 없는 | 침묵 | 조용 | 비밀 | 침묵 | 조용 | 말없는',
    ),
    Emoji(
      '🫥',
      '우울 | 사라짐 | 점선 | 얼굴 | 숨은 | 숨기기 | 내향 | 보이지 않는 | 선 | 에휴 | 뭐든 | 뭐든',
    ),
    Emoji(
      '😏',
      '대장 | 멋진 | 얼굴 | 설렘 | 친구 | 농담 | 흘깃 | 쉐이드 | 날쌘 | 교활 | 히긋 | 건방진 | 킥킥 | 세련된 | 수상 | 스타일',
    ),
    Emoji(
      '😒',
      '... | 지루 | 얼굴 | 괜찮은 | 질투 | 질투 | 질투 | 화남 | 한숨 | 에휴 | uhh | 시큰둥 | 슬픈 | 이상 | 뭐든',
    ),
    Emoji(
      '🙄',
      '눈 굴림 | 눈 | 얼굴 | 굴러 | 쉐이드 | 에휴 | 뭐든',
    ),
    Emoji(
      '😬',
      '어 | 어색 | 치과 | 얼굴 | 찡그림 | 찡그림 | 웃음 | 미소 | 미소',
    ),
    Emoji(
      '🤥',
      '얼굴 | 거짓말 | 거짓말 | 거짓말 | 피노키오',
    ),
    Emoji(
      '😌',
      '차분 | 얼굴 | 피스 | 안도 | 안심 | 선',
    ),
    Emoji(
      '😔',
      '끔찍 | 지루 | 낙담 | 죽은 | 실망 | 얼굴 | 지는 | 잃은 | 생각에 잠긴 | 슬픈 | 별로',
    ),
    Emoji(
      '🥹',
      '감탄 | 어우 | 다시 | 울음 | 부끄 | 얼굴 | 감정 | 감사 | 감사 | 참는 | 기쁨 | 제발 | 자랑 | 참는 | 슬픈 | 눈물',
    ),
    Emoji(
      '😪',
      '울음 | 얼굴 | 좋은 | 밤 | 슬픈 | 잠 | 자는 | 졸린 | 피곤',
    ),
    Emoji(
      '🤤',
      '침 | 얼굴',
    ),
    Emoji(
      '😴',
      '침대 | 취침 | 얼굴 | 좋은 | 잘자 | 낮잠 | 밤 | 잠 | 자는 | 피곤 | 뭐든 | 하품 | zzz',
    ),
    Emoji(
      '😷',
      '추운 | 치과 | dermatologist | 의사 | dr | 얼굴 | 세균 | 가면 | 의료 | 약 | 아픈',
    ),
    Emoji(
      '🤒',
      '얼굴 | 아픈 | 아픈 | 체온계',
    ),
    Emoji(
      '🤕',
      '붕대 | 얼굴 | head-bandage | 다친 | 부상 | 아야',
    ),
    Emoji(
      '🤢',
      '얼굴 | 역겨운 | 역겨운 | 메스꺼움 | 아픈 | 토함',
    ),
    Emoji(
      '🤮',
      '토 | 으 | 얼굴 | 역겨운 | 토 | 아픈 | 토 | 던지다 | 위 | 토함 | 구토',
    ),
    Emoji(
      '🤧',
      '얼굴 | 열 | 독감 | gesundheit | 아픈 | 재채기 | 재채기',
    ),
    Emoji(
      '🥵',
      '죽어감 | 얼굴 | 열난 | 더위 | 더운 | 헐떡 | 빨간 얼굴 | 열사병 | 땀 | 혀',
    ),
    Emoji(
      '🥶',
      '파란 | 파란 얼굴 | 추운 | 얼굴 | 얼어붙은 | 동상 | 고드름 | 영하 | 치아',
    ),
    Emoji(
      '🥴',
      '어지러운 | 취한 | 눈 | 얼굴 | 취한 | 입 | 술기운 | 불균형 | 물결 | 어지러운',
    ),
    Emoji(
      '😵',
      'X | 죽은 | 어지러운 | 눈 | 얼굴 | 감동 | 넘어진 | 아웃 | 아픈 | 피곤',
    ),
    Emoji(
      '😵‍💫',
      '혼란 | 어지러운 | 눈 | 얼굴 | 최면 | 오마이갓 | smiley | 소용돌이 | 문제 | 워 | 워 | 어지러운',
    ),
    Emoji(
      '🤯',
      '날린 | 폭발 | 폭발 | head | 멘탈 | 멘탈붕괴 | 아니 | 충격 | 완전',
    ),
    Emoji(
      '🤠',
      '카우보이 | 카우걸 | 얼굴 | 모자',
    ),
    Emoji(
      '🥳',
      '생일 | 생일 | 축하 | 축하 | 신남 | 얼굴 | 행복 | 모자 | 만세 | 뿔 | 파티 | 파티',
    ),
    Emoji(
      '😎',
      '최고 | 해변 | 밝은 | 브로 | 쉴 | 쿨 | 얼굴 | 쎈 | 편안 | 선글라스 | 완벽 | 미소 | 스타일 | 선글라스 | 스타일 | 승리',
    ),
    Emoji(
      '🤓',
      '똑똑한 | 영리한 | 전문가 | 얼굴 | 덕후 | 재능 | 안경 | 똑똑한 | 덕후 | 똑똑한',
    ),
    Emoji(
      '🧐',
      '고급 | 얼굴 | 고급 | 단안경 | 부자 | 딱딱한 | 부자',
    ),
    Emoji(
      '😕',
      '혼란 | 혼란 | 혼란 | 몰라 | 얼굴 | 찡그림 | 음 | 에휴 | 안 | 슬픈 | 미안 | 확실',
    ),
    Emoji(
      '😟',
      '불안 | 설렘 | 얼굴 | 긴장 | 긴장 | 슬픈 | 스트레스 | 스트레스 | 놀란 | 걱정 | 걱정',
    ),
    Emoji(
      '🙁',
      '얼굴 | 찡그림 | 찡그림 | 슬픈 | 살짝',
    ),
    Emoji(
      '☹️',
      '얼굴 | 찡그림 | 찡그림 | 슬픈',
    ),
    Emoji(
      '😮',
      '믿다 | 얼굴 | 잊은 | 입 | 오마이갓 | 열린 | 충격 | 놀란 | 동정 | 믿기지 않는 | 비현실 | 워 | 와우 | 당신',
    ),
    Emoji(
      '😯',
      '대박 | 얼굴 | 조용한 | 오마이갓 | 넋놓은 | 놀란 | 워 | 워',
    ),
    Emoji(
      '😲',
      '깜짝 | 비용 | 얼굴 | 아니 | 오마이갓 | 충격 | 완전 | 완전',
    ),
    Emoji(
      '😳',
      '놀란 | 어색 | 미친 | 멍한 | 죽은 | 불신 | 부끄 | 얼굴 | 붉어진 | 이런 | 더위 | 더운 | 감동 | 이런 | 뭐 | 와우',
    ),
    Emoji(
      '🥺',
      '간청 | 큰 | 눈 | 얼굴 | 자비 | 안 | 간청 | 제발 | 예쁜 | 강아지 | 슬픈 | 왜',
    ),
    Emoji(
      '😦',
      '걸린 | 얼굴 | 찡그림 | 찡그림 | 경비 | 입 | 열린 | 겁먹은 | 무서운 | 놀람 | 뭐 | 와우',
    ),
    Emoji(
      '😧',
      '고통 | 얼굴 | 잊은 | 겁먹은 | 무서운 | 스트레스 | 놀람 | 슬픈 | 뭐 | 와우',
    ),
    Emoji(
      '😨',
      'afraid | 불안 | 탓 | 얼굴 | 두려움 | 두려운 | 겁먹은 | 걱정',
    ),
    Emoji(
      '😰',
      '불안 | 파란 | 추운 | 으악 | 얼굴 | 입 | 긴장 | 열린 | 급한 | 겁먹은 | 땀 | 이런',
    ),
    Emoji(
      '😥',
      '불안 | 전화 | 가까운 | 복잡 | 실망 | 얼굴 | 안 | 안심 | 슬픈 | 땀 | 시간 | 휴',
    ),
    Emoji(
      '😢',
      '끔찍 | 울음 | 울음 | 얼굴 | 감동 | 보고싶어 | 슬픈 | 눈물 | triste | 슬픈',
    ),
    Emoji(
      '😭',
      '울음 | 울음 | 울음 | 얼굴 | 크게 | 슬픈 | 흐느낌 | 눈물 | 눈물 | 슬픈',
    ),
    Emoji(
      '😱',
      '대박 | 얼굴 | 두려움 | 두려운 | 으악 | 겁먹은 | 비명 | 비명 | 비명 | 충격 | 놀란 | 워',
    ),
    Emoji(
      '😖',
      '짜증 | 당황 | 혼란 | 오글 | 멘붕 | 얼굴 | 감동 | 좌절 | 화남 | 슬픈',
    ),
    Emoji(
      '😣',
      '집중 | 집중 | 얼굴 | 집중 | 두통 | 참다 | 참는',
    ),
    Emoji(
      '😞',
      '끔찍 | 탓 | 낙담 | 실망 | 얼굴 | 실패 | 지는 | 슬픈 | 슬픈',
    ),
    Emoji(
      '😓',
      '가까운 | 추운 | downcast | 얼굴 | 감동 | 두통 | 긴장 | 슬픈 | 겁먹은 | 땀 | 이런',
    ),
    Emoji(
      '😩',
      '울음 | 얼굴 | 실패 | 감동 | 배고픈 | 화남 | 안돼 | 슬픈 | 졸린 | 피곤 | 슬픈 | 지친',
    ),
    Emoji(
      '😫',
      '비용 | 얼굴 | 감동 | 낮잠 | 슬픈 | 재채기 | 피곤',
    ),
    Emoji(
      '😤',
      '화 | 화남 | 얼굴 | 감동 | 화 | 화남 | 분노 | 분노 | 화남 | 코 | 증기 | 승리 | 슬픈 | 이김',
    ),
    Emoji(
      '😡',
      '화 | 화남 | 분노 | 얼굴 | 감동 | 화남 | 미친 | 삐짐 | 분노 | 빨간 | 쉐이드 | 슬픈 | 화남',
    ),
    Emoji(
      '😠',
      '화 | 화남 | 탓 | 얼굴 | 감동 | 좌절 | 화남 | 미친 | 분노 | 쉐이드 | 슬픈 | 화남',
    ),
    Emoji(
      '🤬',
      '검열 | 욕 | 욕 | 얼굴 | 화남 | 입 | 화남 | 욕 | 기호',
    ),
    Emoji(
      '😈',
      '악마 | 악마 | 악 | 얼굴 | 요정 | 동화 | 판타지 | 뿔 | 보라 | 쉐이드 | 미소 | 미소 | 이야기',
    ),
    Emoji(
      '👿',
      '화남 | 악마 | 악마 | 악 | 얼굴 | 요정 | 동화 | 판타지 | 뿔 | imp | mischievous | 보라 | 쉐이드 | 이야기',
    ),
    Emoji(
      '💀',
      '몸 | 죽은 | 죽음 | 얼굴 | 요정 | 동화 | i’m | 롤 | 괴물 | 해골 | 이야기 | yolo',
    ),
    Emoji(
      '☠️',
      '뼈 | X | 죽은 | 죽음 | 얼굴 | 괴물 | 해골',
    ),
    Emoji(
      '💩',
      '말도안돼 | 만화 | 똥 | 똥 | 얼굴 | fml | 괴물 | 무더기 | 똥 | 똥 | 냄새 | 한숨 | 냄새 | 냄새 | 냄새 | 똥',
    ),
    Emoji(
      '🤡',
      '광대 | 얼굴',
    ),
    Emoji(
      '👹',
      '생명체 | 악마 | 얼굴 | 요정 | 동화 | 판타지 | 가면 | 괴물 | 오거 | 무서운 | 이야기',
    ),
    Emoji(
      '👺',
      '화남 | 생명체 | 얼굴 | 요정 | 동화 | 판타지 | 고블린 | 가면 | 심술 | 괴물 | 이야기',
    ),
    Emoji(
      '👻',
      '부 | 생명체 | 신남 | 얼굴 | 요정 | 동화 | 판타지 | 유령 | 할로윈 | 유령 | 괴물 | 무서운 | 어리석은 | 이야기',
    ),
    Emoji(
      '👽',
      '외계인 | 생명체 | 외계 | 얼굴 | 요정 | 동화 | 판타지 | 괴물 | 우주 | 이야기 | UFO',
    ),
    Emoji(
      '👾',
      '외계인 | 생명체 | 외계 | 얼굴 | 요정 | 동화 | 판타지 | 게임 | 게이머 | 게임 | 괴물 | 픽셀 | 우주 | 이야기 | UFO',
    ),
    Emoji(
      '🤖',
      '얼굴 | 괴물 | 로봇',
    ),
    Emoji(
      '🎃',
      '축하 | 할로윈 | 잭 | jack-o-lantern | 등 | 호박',
    ),
    Emoji(
      '😺',
      '동물 | 고양이 | 얼굴 | 웃음 | 입 | 열린 | 미소 | 미소',
    ),
    Emoji(
      '😸',
      '동물 | 고양이 | 눈 | 눈 | 얼굴 | 웃음 | 웃음 | 미소 | 미소',
    ),
    Emoji(
      '😹',
      '동물 | 고양이 | 얼굴 | 기쁨 | 웃음 | 웃는 | 롤 | 눈물 | 눈물',
    ),
    Emoji(
      '😻',
      '동물 | 고양이 | 눈 | 얼굴 | 하트 | 하트눈 | 사랑 | 미소 | 미소',
    ),
    Emoji(
      '😼',
      '동물 | 고양이 | 얼굴 | 아이러니 | 미소 | 비꼰',
    ),
    Emoji(
      '😽',
      '동물 | 고양이 | 감은 | 눈 | 눈 | 얼굴 | 키스 | 키스',
    ),
    Emoji(
      '🙀',
      '동물 | 고양이 | 얼굴 | 오 | 놀란 | 지친',
    ),
    Emoji(
      '😿',
      '동물 | 고양이 | 울음 | 울음 | 얼굴 | 슬픈 | 눈물',
    ),
    Emoji(
      '😾',
      '동물 | 고양이 | 얼굴 | 삐짐',
    ),
    Emoji('🫶', '<3 | 손 | 하트 | 사랑 | 당신', hasSkinTone: true),
    Emoji('👋',
        '잘가 | cya | g2g | 인사 | gtg | 손 | 안녕 | 헤이 | 안녕 | 나중에 | outtie | ttfn | ttyl | 손흔들기 | 요 | 당신',
        hasSkinTone: true),
    Emoji('🤚', '다시 | 손등 | 손 | 든', hasSkinTone: true),
    Emoji('🖐️', '손가락 | 손가락 | 손 | 든 | 펼친 | 멈춤',
        hasSkinTone: true),
    Emoji('✋', '5 | 다섯 | 손 | 하이 | 든 | 멈춤', hasSkinTone: true),
    Emoji('🖖', '손가락 | 손 | 손 | 경례 | 불칸', hasSkinTone: true),
    Emoji('👌',
        '최고 | bet | dope | fleek | fosho | got | gotcha | 손 | legit | 오케이 | okay | 찌 pinch | 쎈 | 확실 | 달콤 | 셋',
        hasSkinTone: true),
    Emoji('🤌',
        '손가락 | 제스처 | 손 | 잡다 | huh | 질문 | 인내 | 찌 pinch | 쉬어 | 비꼼 | 에휴 | 뭐 | 지퍼',
        hasSkinTone: true),
    Emoji('🤏',
        '양 | 조금 | 손가락 | 손 | 작은 | 찌 pinch | 작은 | sort',
        hasSkinTone: true),
    Emoji('🫳',
        '무시 | 아래 | 떨어뜨림 | 떨어진 | 손 | 손바닥 | 고르다 | shoo | 위',
        hasSkinTone: true),
    Emoji('🫴',
        '부르다 | 잡다 | 와 | 손 | 잡다 | 알다 | 들다 | me | 제안 | 손바닥 | 말하다',
        hasSkinTone: true),
    Emoji('✌️', '손 | 피스 | v | 승리', hasSkinTone: true),
    Emoji('🫰',
        '<3 | 교차 | 비싼 | 손가락 | 손 | 하트 | 검지 | 사랑 | 돈 | 스냅 | 엄지',
        hasSkinTone: true),
    Emoji('🤞', '교차 | 교차 | 손가락 | 손가락 | 손 | 행운',
        hasSkinTone: true),
    Emoji(
        '🤟', '손가락 | 제스처 | 손 | 사랑해 | 사랑 | love-you | 셋 | 당신',
        hasSkinTone: true),
    Emoji('🤘', '손가락 | 손 | 뿔 | 락 | 사인', hasSkinTone: true),
    Emoji('🤙', '전화 | 손 | 쉬다 | 느슨한 | me | Shaka', hasSkinTone: true),
    Emoji('👈', '손등 | 손가락 | 손 | 검지 | 왼쪽 | 가리키다 | 가리키는',
        hasSkinTone: true),
    Emoji('👉', '손등 | 손가락 | 손 | 검지 | 가리키다 | 가리키는 | 오른쪽',
        hasSkinTone: true),
    Emoji('👆', '손등 | 손가락 | 손 | 검지 | 가리키다 | 가리키는 | 위',
        hasSkinTone: true),
    Emoji('🖕', '손가락 | 손 | 가운데', hasSkinTone: true),
    Emoji('👇', '손등 | 아래 | 손가락 | 손 | 검지 | 가리키다 | 가리키는',
        hasSkinTone: true),
    Emoji('☝️', '손가락 | 손 | 검지 | 가리키다 | 가리키는 | this | 위',
        hasSkinTone: true),
    Emoji('👍', '+1 | 좋은 | 손 | 좋아 | 엄지 | 위 | 네',
        hasSkinTone: true),
    Emoji('👎',
        '-1 | 나쁜 | 싫어 | 아래 | 좋은 | 손 | 아니 | 아니 | 엄지 | 엄지',
        hasSkinTone: true),
    Emoji('✊', '쥔 | 주먹 | 손 | 펀치 | 든 | 연대',
        hasSkinTone: true),
    Emoji('👊',
        '완전 | 동의 | 쾅 | 브로 | 브로 | 부딪침 | 쥔 | 맞아 | 주먹 | 손 | 주먹 | 맞은편 | 주먹 | 펀치 | 락 | ttyl',
        hasSkinTone: true),
    Emoji('🤛', '주먹 | 왼쪽 | 왼쪽', hasSkinTone: true),
    Emoji('🤜', '주먹 | 오른쪽 | 오른쪽', hasSkinTone: true),
    Emoji('🫲',
        '손 | 악수 | 잡다 | 왼쪽 | leftward | 왼쪽 | 뻗다 | 악수',
        hasSkinTone: true),
    Emoji('🫱',
        '손 | 악수 | 잡다 | 뻗다 | 오른쪽 | rightward | 오른쪽 | 악수',
        hasSkinTone: true),
    Emoji('👏',
        '박수 | 승인 | 최고 | 박수 | 축하 | 축하 | 신남 | 좋은 | great | 손 | 친구 | 잘했어 | 좋은 | prayed | 잘 | 야호',
        hasSkinTone: true),
    Emoji('🙌',
        '축하 | 제스처 | 손 | 손 | 만세 | 칭찬 | 든 | 들어',
        hasSkinTone: true),
    Emoji('👐', '손 | 손 | 포옹 | 재즈 | 열린 | swerve', hasSkinTone: true),
    Emoji('🤲',
        '감싼 | 기도 | 손 | palms | 기도 | 기도 | 함께 | 위 | 소원',
        hasSkinTone: true),
    Emoji('🤝', '합의 | 거래 | 손 | 악수 | 미팅 | 악수',
        hasSkinTone: true),
    Emoji('🙏',
        '감사 | 부탁 | 간청 | 축복 | 인사 | cmon | 다섯 | 접은 | 제스처 | 손 | 하이 | 제발 | 기도 | 감사 | 감사',
        hasSkinTone: true),
    Emoji('🫵', '에게 | 손가락 | 손 | 검지 | 가리키는 | 찌르다 | 당신 | 당신',
        hasSkinTone: true),
    Emoji('✍️', '손 | 쓰다 | 쓰기', hasSkinTone: true),
    Emoji('💅',
        '지루 | 케어 | 화장품 | 끝 | 메이크업 | 매니큐어 | 손톱 | 매니큐어 | 뭐든',
        hasSkinTone: true),
    Emoji('🤳', '카메라 | 폰 | 셀카', hasSkinTone: true),
    Emoji('💪',
        '팔 | 짐승 | bench | 이두박근 | bodybuilder | 브로 | curls | 플렉스 | gains | 헬스 | jacked | 근육 | press | ripped | 강한 | 역도',
        hasSkinTone: true),
    Emoji('🦵', '굽은 | 발 | 차다 | 무릎 | 다리 | 사지', hasSkinTone: true),
    Emoji('🦶', '발목 | 발 | 발 | 차다 | 구르다', hasSkinTone: true),
    Emoji(
        '👂', '몸 | 귀 | ears | 듣다 | 청각 | 듣다 | 듣는 | 소리',
        hasSkinTone: true),
    Emoji('👃', '몸 | 코 | noses | nosey | 냄새 | 냄새 | 냄새',
        hasSkinTone: true),
    Emoji(
      '🧠',
      '뇌 | 똑똑한 | 똑똑한',
    ),
    Emoji(
      '🦴',
      '뼈 | 뼈 | 강아지 | 뼈대 | 숫제비',
    ),
    Emoji(
      '👀',
      '몸 | 눈 | 눈 | 얼굴 | 눈 | 보다 | 보는 | 오마이갓 | 엿보기 | 보다 | 보는',
    ),
    Emoji(
      '👁️',
      '1 | 몸 | 눈 | one',
    ),
    Emoji(
      '💋',
      '데이트 | 감정 | 하트 | 키스 | 키스 | 입술 | 자국 | 로맨스 | 섹시',
    ),
    Emoji(
      '👄',
      '아름다움 | 몸 | 키스 | 키스 | 입술 | 립스틱 | 입',
    ),
    Emoji(
      '🫦',
      '불안 | 물다 | 무는 | 두려움 | 설렘 | 설렘 | 키스 | lip | 립스틱 | 긴장 | 섹시 | 불편 | 걱정 | 걱정',
    ),
    Emoji(
      '🦷',
      '치과 | 진주 | 치아 | 이 | 하얀',
    ),
    Emoji(
      '👅',
      '몸 | 핥다 | 후루룩 | 혀',
    ),
    Emoji('👶',
        '아기 | 아기 | 아이 | goo | 영아 | 갓난아이 | 임신 | 어린',
        hasSkinTone: true),
    Emoji('🧒', '눈 반짝 | 아이 | grandchild | 아이 | 어린 | 더 어린',
        hasSkinTone: true),
    Emoji('👦',
        '남자아이 | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
        hasSkinTone: true),
    Emoji('👧',
        '눈 반짝 | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
        hasSkinTone: true),
    Emoji('🧑', '어른 | 사람', hasSkinTone: true),
    Emoji('👨', '어른 | 브로 | 남자', hasSkinTone: true),
    Emoji('🧔', '수염 | 수염 | 사람 | 수염', hasSkinTone: true),
    Emoji('👱', '금발 | 금발 | 인간 | 사람', hasSkinTone: true),
    Emoji('👨‍🦰', '어른 | 브로 | man ginger | 머리 | 빨간 | 빨간머리',
        hasSkinTone: true),
    Emoji('👨‍🦱', '어른 | 브로 | man afro | 곱슬 | 머리 | 곱슬',
        hasSkinTone: true),
    Emoji('👨‍🦳', '어른 | 브로 | man gray | 머리 | 늙은 | 하얀',
        hasSkinTone: true),
    Emoji('👨‍🦲',
        '어른 | 브로 | man bald | 항암 | 머리 | 털없는 | 아니 | 면도',
        hasSkinTone: true),
    Emoji('👩', '어른 | 여성 | 여자', hasSkinTone: true),
    Emoji(
        '👱‍♀️', '금발 | 금발 | 인간 | person female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('👩‍🦰', '어른 | 여성 | woman ginger | 머리 | 빨간 | 빨간머리',
        hasSkinTone: true),
    Emoji('👩‍🦱', '어른 | 여성 | woman afro | 곱슬 | 머리 | 곱슬',
        hasSkinTone: true),
    Emoji('👩‍🦳', '어른 | 여성 | woman gray | 머리 | 늙은 | 하얀',
        hasSkinTone: true),
    Emoji('👩‍🦲',
        '어른 | 여성 | woman bald | 항암 | 머리 | 털없는 | 아니 | 면도',
        hasSkinTone: true),
    Emoji('🧓', '어른 | 노인 | 조부모 | 늙은 | 사람 | 현명',
        hasSkinTone: true),
    Emoji('👴',
        '어른 | 대머리 | 노인 | 할아버지 | 할아버지 | 할아버지 | 남자 | 늙은 | 현명',
        hasSkinTone: true),
    Emoji('👵',
        '어른 | 노인 | 할머니 | 할머니 | 할머니 | 여성 | 늙은 | 현명 | 여자',
        hasSkinTone: true),
    Emoji('🙍‍♂️',
        '짜증 | 실망 | 불만 | 불안 | 찡그림 | 찡그림 | 좌절 | 제스처 | 짜증 | 사람 | upset male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🙍‍♀️',
        '짜증 | 실망 | 불만 | 불안 | 찡그림 | 찡그림 | 좌절 | 제스처 | 짜증 | 사람 | upset female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🙎‍♂️',
        '실망 | 우울 | 찡그림 | 찡그림 | 사람 | 삐짐 | 찡그림 | 삐짐 | 화남 | whine male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🙎‍♀️',
        '실망 | 우울 | 찡그림 | 찡그림 | 사람 | 삐짐 | 찡그림 | 삐짐 | 화남 | whine female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🙅‍♂️',
        '금지 | 제스처 | 손 | 아니 | 안 | 사람 | prohibit male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🙅‍♀️',
        '금지 | 제스처 | 손 | 아니 | 안 | 사람 | prohibit female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🙆‍♂️',
        '운동 | 제스처 | 제스처 | 손 | 오케이 | 오마이갓 | person male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🙆‍♀️',
        '운동 | 제스처 | 제스처 | 손 | 오케이 | 오마이갓 | person female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('💁‍♂️',
        '가져와 | 튕김 | 뒤집기 | 가십 | 손 | 사람 | 비꼼 | 비꼼 | 쎈 | 진심 | 기울임 | whatever male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('💁‍♀️',
        '가져와 | 튕김 | 뒤집기 | 가십 | 손 | 사람 | 비꼼 | 비꼼 | 쎈 | 진심 | 기울임 | whatever female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🙋‍♂️',
        '제스처 | 손 | 여기 | 알다 | me | 사람 | 고르다 | 질문 | 들어 | raising male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🙋‍♀️',
        '제스처 | 손 | 여기 | 알다 | me | 사람 | 고르다 | 질문 | 들어 | raising female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🙇‍♂️',
        '사과 | 부탁 | 간청 | 인사 | bowing | 부탁 | 용서 | 제스처 | 명상 | 명상 | 사람 | 불쌍 | 후회 | sorry male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🙇‍♀️',
        '사과 | 부탁 | 간청 | 인사 | bowing | 부탁 | 용서 | 제스처 | 명상 | 명상 | 사람 | 불쌍 | 후회 | sorry female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤦‍♂️',
        '또 | 당황 | 불신 | 한숨 |  facepalm | 아니 | 안 | 오 | 오마이갓 | 사람 | 충격 | smh male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤦‍♀️',
        '또 | 당황 | 불신 | 한숨 |  facepalm | 아니 | 안 | 오 | 오마이갓 | 사람 | 충격 | smh female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤷‍♂️',
        '의심 | 몰라 | guess | idk | 무지 | 무관심 | 알다 | 아마 | 사람 | 어깨 으쓱 | 어깨 | 뭐든 | who male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤷‍♀️',
        '의심 | 몰라 | guess | idk | 무지 | 무관심 | 알다 | 아마 | 사람 | 어깨 으쓱 | 어깨 | 뭐든 | who female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('👨‍⚕️',
        '어른 | 브로 | man aesculapius | 의료 | 약 | staff | symbol',
        hasSkinTone: true),
    Emoji('👩‍⚕️',
        '어른 | 여성 | woman aesculapius | 의료 | 약 | staff | symbol',
        hasSkinTone: true),
    Emoji('👨‍🎓', '졸업 | 남자 | 학생', hasSkinTone: true),
    Emoji('👩‍🎓', '졸업 | 학생 | 여자', hasSkinTone: true),
    Emoji('👨‍🏫', '강사 | 강연 | 남자 | 교수 | 선생',
        hasSkinTone: true),
    Emoji('👩‍🏫', '강사 | 강연 | 교수 | 선생 | 여자',
        hasSkinTone: true),
    Emoji('👨‍⚖️',
        '어른 | 브로 | man balance | justice | Libra | scale | scales | tool | weight | zodiac',
        hasSkinTone: true),
    Emoji('👩‍⚖️',
        '어른 | 여성 | woman balance | justice | Libra | scale | scales | tool | weight | zodiac',
        hasSkinTone: true),
    Emoji('👨‍🌾', '농부 | 정원사 | 남자 | 목장', hasSkinTone: true),
    Emoji('👩‍🌾', '농부 | 정원사 | 목장 | 여자', hasSkinTone: true),
    Emoji('👨‍🍳', '요리사 | 요리 | 남자', hasSkinTone: true),
    Emoji('👩‍🍳', '요리사 | 요리 | 여자', hasSkinTone: true),
    Emoji('👨‍🔧', '전기 | 남자 | 정비 | 배관 | 기술자',
        hasSkinTone: true),
    Emoji('👩‍🔧', '전기 | 정비 | 배관 | 기술자 | 여자',
        hasSkinTone: true),
    Emoji('👨‍🏭', '조립 | 공장 | 산업 | 남자 | 노동자',
        hasSkinTone: true),
    Emoji('👩‍🏭', '조립 | 공장 | 산업 | 여자 | 노동자',
        hasSkinTone: true),
    Emoji('👨‍💼',
        '건축가 | 비즈니스 | 남자 | 매니저 | 사무실 | 화이트칼라 | 노동자',
        hasSkinTone: true),
    Emoji('👩‍💼',
        '건축가 | 비즈니스 | 매니저 | 사무실 | 화이트칼라 | 여자 | 노동자',
        hasSkinTone: true),
    Emoji('👨‍🔬',
        '생물학자 | 화학자 | 엔지니어 | 남자 | 수학자 | 물리학자 | 과학자',
        hasSkinTone: true),
    Emoji('👩‍🔬',
        '생물학자 | 화학자 | 엔지니어 | 수학자 | 물리학자 | 과학자 | 여자',
        hasSkinTone: true),
    Emoji('👨‍💻',
        '개발자 | 컴퓨터 | 개발자 | 발명가 | 남자 | 소프트웨어 | 기술자',
        hasSkinTone: true),
    Emoji('👩‍💻',
        '개발자 | 컴퓨터 | 개발자 | 발명가 | 소프트웨어 | 기술자 | 여자',
        hasSkinTone: true),
    Emoji(
        '👨‍🎤', '배우 | 연예인 | 남자 | 락 | 락스타 | 가수 | 별',
        hasSkinTone: true),
    Emoji('👩‍🎤',
        '배우 | 연예인 | 락 | 락스타 | 가수 | 별 | 여자',
        hasSkinTone: true),
    Emoji('👨‍🎨', '예술가 | 남자 | 팔레트', hasSkinTone: true),
    Emoji('👩‍🎨', '예술가 | 팔레트 | 여자', hasSkinTone: true),
    Emoji('👨‍✈️',
        '어른 | 브로 | man aeroplane | airplane | fly | flying | jet | plane | travel',
        hasSkinTone: true),
    Emoji('👩‍✈️',
        '어른 | 여성 | woman aeroplane | airplane | fly | flying | jet | plane | travel',
        hasSkinTone: true),
    Emoji('👨‍🚀', '우주인 | 남자 | 로켓 | 우주', hasSkinTone: true),
    Emoji('👩‍🚀', '우주인 | 로켓 | 우주 | 여자', hasSkinTone: true),
    Emoji('👨‍🚒', 'fire | 소방관 | 소방차 | 남자', hasSkinTone: true),
    Emoji('👩‍🚒', 'fire | 소방관 | 소방차 | 여자', hasSkinTone: true),
    Emoji('👮‍♂️',
        '체포 | 체포 | 벌금 | 경찰 | 법 | 관리 | 넘치는 | 경찰 | 걸린 | undercover male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('👮‍♀️',
        '체포 | 체포 | 벌금 | 경찰 | 법 | 관리 | 넘치는 | 경찰 | 걸린 | undercover female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🕵️‍♂️', 'detective | sleuth | spy male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🕵️‍♀️', 'detective | sleuth | spy female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('💂‍♂️',
        'buckingham | 경비 | helmet | london | palace male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('💂‍♀️',
        'buckingham | 경비 | helmet | london | palace female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('👷‍♂️',
        'build | construction | fix | hardhat | 모자 | 남자 | 사람 | rebuild | remodel | repair | work | worker male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('👷‍♀️',
        'build | construction | fix | hardhat | 모자 | 남자 | 사람 | rebuild | remodel | repair | work | worker female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤴',
        'crown | 요정 | 동화 | 판타지 | king | prince | royal | royalty | 이야기',
        hasSkinTone: true),
    Emoji('👸',
        'crown | 요정 | 동화 | 판타지 | princess | queen | royal | royalty | 이야기',
        hasSkinTone: true),
    Emoji('👳‍♂️', '사람 | turban | wearing male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('👳‍♀️', '사람 | turban | wearing female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('👲',
        'cap | Chinese | gua | guapi | 모자 | mao | 사람 | pi | skullcap',
        hasSkinTone: true),
    Emoji('🧕',
        'bandana | head | headscarf | hijab | kerchief | mantilla | tichel | 여자',
        hasSkinTone: true),
    Emoji('🤵', 'formal | 사람 | tuxedo | wedding', hasSkinTone: true),
    Emoji('👰', '사람 | veil | wedding', hasSkinTone: true),
    Emoji('🤰', '임신 | 여자', hasSkinTone: true),
    Emoji('🤱',
        '아기 | breast | breast-feeding | feeding | mom | mother | nursing | 여자',
        hasSkinTone: true),
    Emoji('👼',
        '천사 | 아기 | church | 얼굴 | 요정 | 동화 | 판타지 | 이야기',
        hasSkinTone: true),
    Emoji('🎅',
        '축하 | Christmas | claus | 요정 | 판타지 | father | holiday | merry | santa | 이야기 | xmas',
        hasSkinTone: true),
    Emoji('🤶',
        '축하 | Christmas | claus | 요정 | 판타지 | holiday | merry | mother | Mrs | santa | 이야기 | xmas',
        hasSkinTone: true),
    Emoji('🦸‍♂️', '좋은 | hero | superhero | superpower male | 남자 | 사인',
        hasSkinTone: true),
    Emoji(
        '🦸‍♀️', '좋은 | hero | superhero | superpower female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🦹‍♂️',
        '나쁜 | criminal | 악 | superpower | supervillain | villain male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🦹‍♀️',
        '나쁜 | criminal | 악 | superpower | supervillain | villain female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧙‍♂️',
        '판타지 | mage | magic | play | sorcerer | sorceress | sorcery | spell | summon | witch | wizard male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧙‍♀️',
        '판타지 | mage | magic | play | sorcerer | sorceress | sorcery | spell | summon | witch | wizard female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧚‍♂️',
        '요정 | 동화 | 판타지 | myth | 사람 | pixie | 이야기 | wings male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧚‍♀️',
        '요정 | 동화 | 판타지 | myth | 사람 | pixie | 이야기 | wings female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧛‍♂️',
        'blood | Dracula | fangs | 할로윈 | 무서운 | supernatural | 치아 | undead | vampire male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧛‍♀️',
        'blood | Dracula | fangs | 할로윈 | 무서운 | supernatural | 치아 | undead | vampire female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧜‍♂️',
        '생명체 | 동화 | folklore | merperson | ocean | sea | siren | trident male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧜‍♀️',
        '생명체 | 동화 | folklore | merperson | ocean | sea | siren | trident female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧝‍♂️',
        'elf | elves | enchantment | 판타지 | folklore | magic | magical | myth male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧝‍♀️',
        'elf | elves | enchantment | 판타지 | folklore | magic | magical | myth female | 사인 | 여자',
        hasSkinTone: true),
    Emoji(
      '🧞‍♂️',
      'djinn | 판타지 | genie | jinn | lamp | myth | rub | wishes male | 남자 | 사인',
    ),
    Emoji(
      '🧞‍♀️',
      'djinn | 판타지 | genie | jinn | lamp | myth | rub | wishes female | 사인 | 여자',
    ),
    Emoji(
      '🧟‍♂️',
      'apocalypse | 죽은 | 할로윈 | horror | 무서운 | undead | walking | zombie male | 남자 | 사인',
    ),
    Emoji(
      '🧟‍♀️',
      'apocalypse | 죽은 | 할로윈 | horror | 무서운 | undead | walking | zombie female | 사인 | 여자',
    ),
    Emoji('💆‍♂️',
        '얼굴 | getting | 두통 | massage | 사람 | 쉬어 | relaxing | salon | soothe | spa | tension | therapy | treatment male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('💆‍♀️',
        '얼굴 | getting | 두통 | massage | 사람 | 쉬어 | relaxing | salon | soothe | spa | tension | therapy | treatment female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('💇‍♂️',
        'barber | 아름다움 | chop | cosmetology | cut | groom | 머리 | haircut | parlor | 사람 | shears | style male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('💇‍♀️',
        'barber | 아름다움 | chop | cosmetology | cut | groom | 머리 | haircut | parlor | 사람 | shears | style female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🚶‍♂️',
        'amble | gait | hike | 남자 | pace | pedestrian | 사람 | stride | stroll | walk | walking male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🚶‍♀️',
        'amble | gait | hike | 남자 | pace | pedestrian | 사람 | stride | stroll | walk | walking female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🏃‍♂️',
        'fast | hurry | marathon | move | 사람 | quick | race | racing | run | rush | speed male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🏃‍♀️',
        'fast | hurry | marathon | move | 사람 | quick | race | racing | run | rush | speed female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🕺',
        'dance | dancer | dancing | elegant | festive | flair | flamenco | groove | let’s | 남자 | salsa | tango',
        hasSkinTone: true),
    Emoji('💃',
        'dance | dancer | dancing | elegant | festive | flair | flamenco | groove | let’s | salsa | tango | 여자',
        hasSkinTone: true),
    Emoji('🕴️', '비즈니스 | levitating | 사람 | suit', hasSkinTone: true),
    Emoji(
      '👯‍♂️',
      'bestie | bff | bunny | counterpart | dancer | double | 귀 | identical | pair | 파티 | 파티 | people | soulmate | twin | twinsies male | 남자 | 사인',
    ),
    Emoji(
      '👯‍♀️',
      'bestie | bff | bunny | counterpart | dancer | double | 귀 | identical | pair | 파티 | 파티 | people | soulmate | twin | twinsies female | 사인 | 여자',
    ),
    Emoji('🧖‍♂️',
        'day | luxurious | pamper | 사람 | 쉬어 | room | sauna | spa | 증기 | steambath | unwind male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧖‍♀️',
        'day | luxurious | pamper | 사람 | 쉬어 | room | sauna | spa | 증기 | steambath | unwind female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧘',
        '교차 | legged | legs | lotus | 명상 | 피스 | 사람 | position | 쉬어 | serenity | yoga | yogi | 선',
        hasSkinTone: true),
    Emoji('👭',
        '베프 | bestie | bff | couple | 데이트 | 설렘 | friends | girls | 손 | 잡다 | sisters | twins | women',
        hasSkinTone: true),
    Emoji('👫',
        '베프 | bestie | bff | couple | 데이트 | 설렘 | friends | 손 | 잡다 | 남자 | twins | 여자',
        hasSkinTone: true),
    Emoji('👬',
        '베프 | bestie | bff | boys | brothers | couple | 데이트 | 설렘 | friends | 손 | 잡다 | men | twins',
        hasSkinTone: true),
    Emoji(
      '💏',
      'anniversary | babe | 베프 | couple | 데이트 | 데이트 | 하트 | 키스 | 사랑 | mwah | 사람 | 로맨스 | 함께 | 뽀뽀',
    ),
    Emoji(
      '👨‍❤️‍💋‍👨',
      '어른 | 브로 | man emotion | 하트 | 사랑 | red dating | 감정 | 하트 | 키스 | 키스 | 입술 | 자국 | 로맨스 | sexy adult | 브로 | 남자',
    ),
    Emoji(
      '👩‍❤️‍💋‍👩',
      '어른 | 여성 | woman emotion | 하트 | 사랑 | red dating | 감정 | 하트 | 키스 | 키스 | 입술 | 자국 | 로맨스 | sexy adult | 여성 | 여자',
    ),
    Emoji(
      '💑',
      'anniversary | babe | 베프 | couple | 데이트 | 하트 | 키스 | 사랑 | 사람 | relationship | 로맨스 | 함께 | 당신',
    ),
    Emoji(
      '👨‍❤️‍👨',
      '어른 | 브로 | man emotion | 하트 | 사랑 | red adult | 브로 | 남자',
    ),
    Emoji(
      '👩‍❤️‍👩',
      '어른 | 여성 | woman emotion | 하트 | 사랑 | red adult | 여성 | 여자',
    ),
    Emoji(
      '👪',
      '아이 | family',
    ),
    Emoji(
      '👨‍👩‍👦',
      '어른 | 브로 | man adult | 여성 | woman boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👩‍👧',
      '어른 | 브로 | man adult | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👨‍👩‍👧‍👦',
      '어른 | 브로 | man adult | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👩‍👦‍👦',
      '어른 | 브로 | man adult | 여성 | woman boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | younger boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👩‍👧‍👧',
      '어른 | 브로 | man adult | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👨‍👨‍👦',
      '어른 | 브로 | man adult | 브로 | man boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👨‍👧',
      '어른 | 브로 | man adult | 브로 | man bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👨‍👨‍👧‍👦',
      '어른 | 브로 | man adult | 브로 | man bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👨‍👦‍👦',
      '어른 | 브로 | man adult | 브로 | man boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | younger boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👨‍👧‍👧',
      '어른 | 브로 | man adult | 브로 | man bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👩‍👩‍👦',
      '어른 | 여성 | woman adult | 여성 | woman boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👩‍👩‍👧',
      '어른 | 여성 | woman adult | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👩‍👩‍👧‍👦',
      '어른 | 여성 | woman adult | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👩‍👩‍👦‍👦',
      '어른 | 여성 | woman adult | 여성 | woman boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | younger boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👩‍👩‍👧‍👧',
      '어른 | 여성 | woman adult | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👨‍👦',
      '어른 | 브로 | man boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👦‍👦',
      '어른 | 브로 | man boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | younger boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👧',
      '어른 | 브로 | man bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👨‍👧‍👦',
      '어른 | 브로 | man bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👨‍👧‍👧',
      '어른 | 브로 | man bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👩‍👦',
      '어른 | 여성 | woman boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👩‍👦‍👦',
      '어른 | 여성 | woman boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | younger boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👩‍👧',
      '어른 | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '👩‍👧‍👦',
      '어른 | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac boy | 눈 반짝 | 아이 | 손자 | 아이 | 아들 | 어린 | 더 어린',
    ),
    Emoji(
      '👩‍👧‍👧',
      '어른 | 여성 | woman bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac bright-eyed | 아이 | 딸 | 여자아이 | 손녀 | 아이 | Virgo | 어린 | 더 어린 | zodiac',
    ),
    Emoji(
      '🗣️',
      '얼굴 | head | silhouette | speak | speaking',
    ),
    Emoji(
      '👤',
      'bust | mysterious | shadow | silhouette',
    ),
    Emoji(
      '👥',
      'bff | bust | busts | everyone | friend | friends | people | silhouette',
    ),
    Emoji(
      '🫂',
      'comfort | embrace | farewell | friendship | goodbye | 안녕 | 포옹 | 포옹 | 사랑 | people | 감사',
    ),
    Emoji(
      '👣',
      'barefoot | clothing | footprint | footprints | omw | print | walk',
    ),
    Emoji(
      '🧳',
      'bag | luggage | packing | roller | suitcase | travel',
    ),
    Emoji(
      '🌂',
      '감은 | clothing | rain | umbrella',
    ),
    Emoji(
      '☂️',
      'clothing | rain | umbrella',
    ),
    Emoji(
      '🧵',
      'needle | sewing | spool | string | thread',
    ),
    Emoji(
      '🧶',
      'ball | crochet | knit | yarn',
    ),
    Emoji(
      '👓',
      'clothing | 눈 | eyeglasses | eyewear | 안경',
    ),
    Emoji(
      '🕶️',
      'dark | 눈 | eyewear | 안경 | 선글라스',
    ),
    Emoji(
      '🥽',
      'dive | 눈 | goggles | protection | scuba | swimming | welding',
    ),
    Emoji(
      '🥼',
      'clothes | coat | 의사 | dr | experiment | jacket | lab | 과학자 | 하얀',
    ),
    Emoji(
      '👔',
      'clothing | employed | necktie | serious | shirt | tie',
    ),
    Emoji(
      '👕',
      '파란 | casual | clothes | clothing | collar | dressed | shirt | shopping | t-shirt | tshirt | weekend',
    ),
    Emoji(
      '👖',
      '파란 | casual | clothes | clothing | denim | dressed | jeans | pants | shopping | trousers | weekend',
    ),
    Emoji(
      '🧣',
      'bundle | 추운 | neck | scarf | 위',
    ),
    Emoji(
      '🧤',
      'gloves | 손',
    ),
    Emoji(
      '🧥',
      'brr | bundle | coat | 추운 | jacket | 위',
    ),
    Emoji(
      '🧦',
      'socks | stocking',
    ),
    Emoji(
      '👗',
      'clothes | clothing | dress | dressed | 고급 | shopping',
    ),
    Emoji(
      '👘',
      'clothing | comfortable | kimono',
    ),
    Emoji(
      '👙',
      'bathing | 해변 | bikini | clothing | pool | suit | swim',
    ),
    Emoji(
      '👚',
      'blouse | clothes | clothing | collar | dress | dressed | 여성 | shirt | shopping | 여자 | woman’s',
    ),
    Emoji(
      '👛',
      'clothes | clothing | coin | dress | 고급 | handbag | purse | shopping',
    ),
    Emoji(
      '👜',
      'bag | clothes | clothing | dress | handbag | 여성 | purse | shopping',
    ),
    Emoji(
      '👝',
      'bag | clothes | clothing | clutch | dress | handbag | pouch | purse',
    ),
    Emoji(
      '🎒',
      'backpack | backpacking | bag | bookbag | education | rucksack | satchel | school',
    ),
    Emoji(
      '👞',
      'brown | clothes | clothing | 발 | 발 | 차다 | 남자 | man’s | shoe | shoes | shopping',
    ),
    Emoji(
      '👟',
      'athletic | clothes | clothing | fast | 차다 | running | shoe | shoes | shopping | sneaker | tennis',
    ),
    Emoji(
      '🥾',
      'backpacking | boot | brown | camping | hiking | outdoors | shoe',
    ),
    Emoji(
      '🥿',
      'ballet | comfy | flat | flats | shoe | slip-on | slipper',
    ),
    Emoji(
      '👠',
      'clothes | clothing | dress | fashion | heel | heels | high-heeled | shoe | shoes | shopping | stiletto | 여자',
    ),
    Emoji(
      '👡',
      'clothing | sandal | shoe | 여자 | woman’s',
    ),
    Emoji(
      '👢',
      'boot | clothes | clothing | dress | shoe | shoes | shopping | 여자 | woman’s',
    ),
    Emoji(
      '👑',
      'clothing | crown | family | king | medieval | queen | royal | royalty | 승리',
    ),
    Emoji(
      '👒',
      'clothes | clothing | garden | 모자 | hats | 파티 | 여자 | woman’s',
    ),
    Emoji(
      '🎩',
      'clothes | clothing | 고급 | formal | 모자 | magic | top | tophat',
    ),
    Emoji(
      '🎓',
      'cap | 축하 | clothing | education | graduation | 모자 | scholar',
    ),
    Emoji(
      '🧢',
      'baseball | 굽은 | billed | cap | dad | 모자',
    ),
    Emoji(
      '⛑️',
      'aid | 교차 | 얼굴 | 모자 | helmet | rescue | worker’s',
    ),
    Emoji(
      '💄',
      '화장품 | 데이트 | 립스틱 | 메이크업',
    ),
    Emoji(
      '💍',
      'diamond | engaged | engagement | married | ring | 로맨스 | shiny | sparkling | wedding',
    ),
    Emoji(
      '💼',
      'briefcase | 사무실',
    ),
  ]),

// ======================================================= Category.ANIMALS
  CategoryEmoji(Category.ANIMALS, [
    Emoji(
      '🐶',
      '귀여워 | 동물 | 강아지 | 얼굴 | 반려동물 | puppies | 강아지',
    ),
    Emoji(
      '🐱',
      '동물 | 고양이 | 얼굴 | kitten | kitty | 반려동물',
    ),
    Emoji(
      '🐭',
      '동물 | 얼굴 | mouse',
    ),
    Emoji(
      '🐹',
      '동물 | 얼굴 | hamster | 반려동물',
    ),
    Emoji(
      '🐰',
      '동물 | bunny | 얼굴 | 반려동물 | rabbit',
    ),
    Emoji(
      '🦊',
      '동물 | 얼굴 | fox',
    ),
    Emoji(
      '🐻',
      '동물 | bear | 얼굴 | grizzly | growl | honey',
    ),
    Emoji(
      '🐼',
      '동물 | bamboo | 얼굴 | panda',
    ),
    Emoji(
      '🐨',
      '동물 | australia | bear | 아래 | 얼굴 | koala | marsupial | under',
    ),
    Emoji(
      '🐯',
      '동물 | 큰 | 고양이 | 얼굴 | predator | tiger',
    ),
    Emoji(
      '🦁',
      'alpha | 동물 | 얼굴 | Leo | lion | mane | order | rawr | roar | safari | 강한 | zodiac',
    ),
    Emoji(
      '🐮',
      '동물 | cow | 얼굴 | farm | milk | moo',
    ),
    Emoji(
      '🐷',
      '동물 | bacon | 얼굴 | farm | pig | pork',
    ),
    Emoji(
      '🐽',
      '동물 | 얼굴 | farm | 코 | pig | 냄새 | snout',
    ),
    Emoji(
      '🐸',
      '동물 | 얼굴 | frog',
    ),
    Emoji(
      '🐵',
      '동물 | banana | 얼굴 | monkey',
    ),
    Emoji(
      '🙈',
      '부끄 | 악 | 얼굴 | 금지 | 잊은 | 제스처 | 숨기기 | monkey | 아니 | 오마이갓 | prohibited | 겁먹은 | 비밀 | 한숨 | watch',
    ),
    Emoji(
      '🙉',
      '동물 | ears | 악 | 얼굴 | 금지 | 제스처 | 듣다 | 듣다 | monkey | 아니 | 안 | prohibited | 비밀 | 쉿 | tmi',
    ),
    Emoji(
      '🙊',
      '동물 | 악 | 얼굴 | 금지 | 제스처 | monkey | 아니 | 안 | 앗 | prohibited | 조용 | 비밀 | speak | stealth',
    ),
    Emoji(
      '🐒',
      '동물 | banana | monkey',
    ),
    Emoji(
      '💥',
      'bomb | 쾅 | collide | collision | 만화 | 폭발',
    ),
    Emoji(
      '💫',
      '만화 | 어지러운 | shining | shooting | 별 | stars',
    ),
    Emoji(
      '💦',
      '만화 | drip | droplet | droplets | drops | splashing | squirt | 땀 | water | wet | work | workout',
    ),
    Emoji(
      '💨',
      'away | cloud | 만화 | dash | dashing | fart | fast | go | gone | gotta | running | smoke',
    ),
    Emoji(
      '🦍',
      '동물 | gorilla',
    ),
    Emoji(
      '🐕',
      '동물 | animals | 강아지 | dogs | 반려동물',
    ),
    Emoji(
      '🐩',
      '동물 | 강아지 | fluffy | poodle',
    ),
    Emoji(
      '🐺',
      '동물 | 얼굴 | wolf',
    ),
    Emoji(
      '🦝',
      '동물 | curious | raccoon | 교활',
    ),
    Emoji(
      '🐈',
      '동물 | animals | 고양이 | cats | kitten | 반려동물',
    ),
    Emoji(
      '🐅',
      '동물 | 큰 | 고양이 | predator | tiger | zoo',
    ),
    Emoji(
      '🐆',
      '동물 | 큰 | 고양이 | leopard | predator | zoo',
    ),
    Emoji(
      '🐴',
      '동물 | dressage | equine | 얼굴 | farm | horse | horses',
    ),
    Emoji(
      '🐎',
      '동물 | equestrian | farm | horse | racehorse | racing',
    ),
    Emoji(
      '🦄',
      '얼굴 | unicorn',
    ),
    Emoji(
      '🦓',
      '동물 | stripe | zebra',
    ),
    Emoji(
      '🐂',
      '동물 | animals | bull | farm | ox | Taurus | zodiac',
    ),
    Emoji(
      '🐃',
      '동물 | buffalo | water | zoo',
    ),
    Emoji(
      '🐄',
      '동물 | animals | cow | farm | milk | moo',
    ),
    Emoji(
      '🐖',
      '동물 | bacon | farm | pig | pork | sow',
    ),
    Emoji(
      '🐗',
      '동물 | boar | pig',
    ),
    Emoji(
      '🐏',
      '동물 | Aries | 뿔 | 남성 | ram | sheep | zodiac | zoo',
    ),
    Emoji(
      '🐑',
      '동물 | baa | ewe | farm | 여성 | fluffy | lamb | sheep | wool',
    ),
    Emoji(
      '🐐',
      '동물 | Capricorn | farm | goat | milk | zodiac',
    ),
    Emoji(
      '🐪',
      '동물 | camel | desert | dromedary | hump | one',
    ),
    Emoji(
      '🐫',
      '동물 | bactrian | camel | desert | hump | two | two-hump',
    ),
    Emoji(
      '🦙',
      'alpaca | 동물 | guanaco | llama | vicuña | wool',
    ),
    Emoji(
      '🦒',
      '동물 | giraffe | spots',
    ),
    Emoji(
      '🐘',
      '동물 | elephant',
    ),
    Emoji(
      '🦏',
      '동물 | rhinoceros',
    ),
    Emoji(
      '🦛',
      '동물 | hippo | hippopotamus',
    ),
    Emoji(
      '🐁',
      '동물 | animals | mouse',
    ),
    Emoji(
      '🐀',
      '동물 | rat',
    ),
    Emoji(
      '🐇',
      '동물 | bunny | 반려동물 | rabbit',
    ),
    Emoji(
      '🐿️',
      '동물 | chipmunk | squirrel',
    ),
    Emoji(
      '🦔',
      '동물 | hedgehog | spiny',
    ),
    Emoji(
      '🦇',
      '동물 | bat | vampire',
    ),
    Emoji(
      '🦘',
      '동물 | joey | jump | kangaroo | marsupial',
    ),
    Emoji(
      '🦡',
      '동물 | badger | honey | pester',
    ),
    Emoji(
      '🐾',
      '발 | paw | paws | print | prints',
    ),
    Emoji(
      '🦃',
      'bird | gobble | thanksgiving | turkey',
    ),
    Emoji(
      '🐔',
      '동물 | bird | chicken | ornithology',
    ),
    Emoji(
      '🐓',
      '동물 | bird | ornithology | rooster',
    ),
    Emoji(
      '🐣',
      '동물 | 아기 | bird | chick | egg | hatching',
    ),
    Emoji(
      '🐤',
      '동물 | 아기 | bird | chick | ornithology',
    ),
    Emoji(
      '🐥',
      '동물 | 아기 | bird | chick | front-facing | 갓난아이 | ornithology',
    ),
    Emoji(
      '🐦',
      '동물 | bird | ornithology',
    ),
    Emoji(
      '🐧',
      '동물 | antarctica | bird | ornithology | penguin',
    ),
    Emoji(
      '🕊️',
      'bird | dove | fly | ornithology | 피스',
    ),
    Emoji(
      '🦅',
      '동물 | bird | eagle | ornithology',
    ),
    Emoji(
      '🦆',
      '동물 | bird | duck | ornithology',
    ),
    Emoji(
      '🦢',
      '동물 | bird | cygnet | duckling | ornithology | swan | ugly',
    ),
    Emoji(
      '🦉',
      '동물 | bird | ornithology | owl | 현명',
    ),
    Emoji(
      '🦚',
      '동물 | bird | colorful | ornithology | ostentatious | peacock | peahen | 예쁜 | 자랑',
    ),
    Emoji(
      '🦜',
      '동물 | bird | ornithology | parrot | pirate | talk',
    ),
    Emoji(
      '🐊',
      '동물 | crocodile | zoo',
    ),
    Emoji(
      '🐢',
      '동물 | terrapin | tortoise | turtle',
    ),
    Emoji(
      '🦎',
      '동물 | lizard | reptile',
    ),
    Emoji(
      '🐍',
      '동물 | bearer | Ophiuchus | serpent | snake | zodiac',
    ),
    Emoji(
      '🐲',
      '동물 | dragon | 얼굴 | 요정 | 동화 | 이야기',
    ),
    Emoji(
      '🐉',
      '동물 | dragon | 요정 | 동화 | knights | 이야기',
    ),
    Emoji(
      '🦕',
      'brachiosaurus | brontosaurus | dinosaur | diplodocus | sauropod',
    ),
    Emoji(
      '🦖',
      'dinosaur | Rex | T | T-Rex | Tyrannosaurus',
    ),
    Emoji(
      '🧌',
      '요정 | 판타지 | 괴물 | 이야기 | troll | trolling',
    ),
    Emoji(
      '🐳',
      '동물 | 해변 | 얼굴 | ocean | spouting | whale',
    ),
    Emoji(
      '🐋',
      '동물 | 해변 | ocean | whale',
    ),
    Emoji(
      '🐬',
      '동물 | 해변 | dolphin | flipper | ocean',
    ),
    Emoji(
      '🐟',
      '동물 | dinner | fish | fishes | fishing | Pisces | zodiac',
    ),
    Emoji(
      '🐠',
      '동물 | fish | fishes | tropical',
    ),
    Emoji(
      '🐡',
      '동물 | blowfish | fish',
    ),
    Emoji(
      '🦈',
      '동물 | fish | shark',
    ),
    Emoji(
      '🐙',
      '동물 | 생명체 | ocean | octopus',
    ),
    Emoji(
      '🪹',
      'branch | empty | home | nest | nesting',
    ),
    Emoji(
      '🪺',
      'bird | branch | egg | eggs | nest | nesting',
    ),
    Emoji(
      '🐚',
      '동물 | 해변 | conch | sea | shell | 소용돌이',
    ),
    Emoji(
      '🪸',
      'change | climate | coral | ocean | reef | sea',
    ),
    Emoji(
      '🐌',
      '동물 | escargot | garden | nature | slug | snail',
    ),
    Emoji(
      '🦋',
      'butterfly | insect | 예쁜',
    ),
    Emoji(
      '🐛',
      '동물 | bug | garden | insect',
    ),
    Emoji(
      '🐜',
      '동물 | ant | garden | insect',
    ),
    Emoji(
      '🐝',
      '동물 | bee | bumblebee | honey | honeybee | insect | nature | spring',
    ),
    Emoji(
      '🐞',
      '동물 | beetle | garden | insect | 여성 | ladybird | ladybug | nature',
    ),
    Emoji(
      '🦗',
      '동물 | bug | cricket | grasshopper | insect | Orthoptera',
    ),
    Emoji(
      '🕷️',
      '동물 | insect | spider',
    ),
    Emoji(
      '🕸️',
      'spider | web',
    ),
    Emoji(
      '🦂',
      'Scorpio | scorpion | Scorpius | zodiac',
    ),
    Emoji(
      '🦟',
      '물다 | disease | 열 | insect | malaria | mosquito | pest | virus',
    ),
    Emoji(
      '🦠',
      'amoeba | bacteria | microbe | science | virus',
    ),
    Emoji(
      '💐',
      'anniversary | 생일 | bouquet | 데이트 | flower | 사랑 | plant | 로맨스',
    ),
    Emoji(
      '🌸',
      'blossom | cherry | flower | plant | spring | springtime',
    ),
    Emoji(
      '💮',
      'flower | 하얀',
    ),
    Emoji(
      '🏵️',
      'plant | rosette',
    ),
    Emoji(
      '🪷',
      '아름다움 | Buddhism | 차분 | flower | Hinduism | lotus | 피스 | purity | serenity',
    ),
    Emoji(
      '🌹',
      '아름다움 | elegant | flower | 사랑 | plant | 빨간 | rose | valentine',
    ),
    Emoji(
      '🥀',
      '죽어감 | flower | wilted',
    ),
    Emoji(
      '🌺',
      'flower | hibiscus | plant',
    ),
    Emoji(
      '🌻',
      'flower | outdoors | plant | sun | sunflower',
    ),
    Emoji(
      '🌼',
      'blossom | buttercup | dandelion | flower | plant',
    ),
    Emoji(
      '🌷',
      'blossom | flower | growth | plant | tulip',
    ),
    Emoji(
      '🌱',
      'plant | sapling | seedling | sprout | 어린',
    ),
    Emoji(
      '🌲',
      'christmas | evergreen | forest | pine | tree',
    ),
    Emoji(
      '🌳',
      'deciduous | forest | green | habitat | shedding | tree',
    ),
    Emoji(
      '🌴',
      '해변 | 손바닥 | plant | tree | tropical',
    ),
    Emoji(
      '🌵',
      'cactus | desert | drought | nature | plant',
    ),
    Emoji(
      '🌾',
      '귀 | grain | grains | plant | rice | sheaf',
    ),
    Emoji(
      '🌿',
      'herb | leaf | plant',
    ),
    Emoji(
      '☘️',
      'irish | plant | shamrock',
    ),
    Emoji(
      '🍀',
      '4 | clover | four | four-leaf | irish | leaf | lucky | plant',
    ),
    Emoji(
      '🍁',
      'falling | leaf | maple',
    ),
    Emoji(
      '🍂',
      'autumn | fall | fallen | falling | leaf',
    ),
    Emoji(
      '🍃',
      'blow | flutter | fluttering | leaf | wind',
    ),
    Emoji(
      '🍄',
      'fungus | mushroom | toadstool',
    ),
    Emoji(
      '🌰',
      'almond | chestnut | plant',
    ),
    Emoji(
      '🦀',
      'Cancer | crab | zodiac',
    ),
    Emoji(
      '🦞',
      '동물 | bisque | claws | lobster | seafood',
    ),
    Emoji(
      '🦐',
      '음식 | shellfish | shrimp | 작은',
    ),
    Emoji(
      '🦑',
      '동물 | 음식 | mollusk | squid',
    ),
    Emoji(
      '🌍',
      'Africa | earth | Europe | Europe-Africa | globe | showing | world',
    ),
    Emoji(
      '🌎',
      'Americas | earth | globe | showing | world',
    ),
    Emoji(
      '🌏',
      'Asia | Asia-Australia | Australia | earth | globe | showing | world',
    ),
    Emoji(
      '🌐',
      'earth | globe | internet | meridians | web | world | worldwide',
    ),
    Emoji(
      '🌑',
      'dark | moon | new | 우주',
    ),
    Emoji(
      '🌒',
      'crescent | dreams | moon | 우주 | waxing',
    ),
    Emoji(
      '🌓',
      'first | moon | quarter | 우주',
    ),
    Emoji(
      '🌔',
      'gibbous | moon | 우주 | waxing',
    ),
    Emoji(
      '🌕',
      '배부른 | moon | 우주',
    ),
    Emoji(
      '🌖',
      'gibbous | moon | 우주 | waning',
    ),
    Emoji(
      '🌗',
      'last | moon | quarter | 우주',
    ),
    Emoji(
      '🌘',
      'crescent | moon | 우주 | waning',
    ),
    Emoji(
      '🌙',
      'crescent | moon | ramadan | 우주',
    ),
    Emoji(
      '🌚',
      '얼굴 | moon | new | 우주',
    ),
    Emoji(
      '🌛',
      '얼굴 | first | moon | quarter | 우주',
    ),
    Emoji(
      '🌜',
      'dreams | 얼굴 | last | moon | quarter',
    ),
    Emoji(
      '☀️',
      '밝은 | rays | 우주 | sun | sunny | weather',
    ),
    Emoji(
      '🌝',
      '밝은 | 얼굴 | 배부른 | moon',
    ),
    Emoji(
      '🌞',
      '해변 | 밝은 | day | 얼굴 | 더위 | shine | sun | sunny | sunshine | weather',
    ),
    Emoji(
      '⭐',
      'astronomy | medium | 별 | stars | 하얀',
    ),
    Emoji(
      '🌟',
      'glittery | glow | glowing | 밤 | shining | sparkle | 별 | 승리',
    ),
    Emoji(
      '🌠',
      'falling | 밤 | shooting | 우주 | 별',
    ),
    Emoji(
      '☁️',
      'cloud | weather',
    ),
    Emoji(
      '⛅',
      'behind | cloud | cloudy | sun | weather',
    ),
    Emoji(
      '⛈️',
      'cloud | lightning | rain | thunder | thunderstorm',
    ),
    Emoji(
      '🌤️',
      'behind | cloud | sun | weather',
    ),
    Emoji(
      '🌥️',
      'behind | cloud | sun | weather',
    ),
    Emoji(
      '🌦️',
      'behind | cloud | rain | sun | weather',
    ),
    Emoji(
      '🌧️',
      'cloud | rain | weather',
    ),
    Emoji(
      '🌨️',
      'cloud | 추운 | snow | weather',
    ),
    Emoji(
      '🌩️',
      'cloud | lightning | weather',
    ),
    Emoji(
      '🌪️',
      'cloud | tornado | weather | whirlwind',
    ),
    Emoji(
      '🌫️',
      'cloud | fog | weather',
    ),
    Emoji(
      '🌬️',
      'blow | cloud | 얼굴 | wind',
    ),
    Emoji(
      '🌈',
      'gay | genderqueer | glbt | glbtq | lesbian | lgbt | lgbtq | lgbtqia | nature | pride | queer | rain | rainbow | trans | transgender | weather',
    ),
    Emoji(
      '☂️',
      'clothing | rain | umbrella',
    ),
    Emoji(
      '☔',
      'clothing | 떨어뜨림 | drops | rain | umbrella | weather',
    ),
    Emoji(
      '⚡',
      'danger | electric | electricity | 하이 | lightning | nature | thunder | thunderbolt | voltage | zap',
    ),
    Emoji(
      '❄️',
      '추운 | snow | snowflake | weather',
    ),
    Emoji(
      '☃️',
      '추운 | 남자 | snow | snowman',
    ),
    Emoji(
      '⛄',
      '추운 | 남자 | snow | snowman',
    ),
    Emoji(
      '☄️',
      'comet | 우주',
    ),
    Emoji(
      '🔥',
      'af | burn | fire | flame | 더운 | lit | litaf | tool',
    ),
    Emoji(
      '💧',
      '추운 | 만화 | 떨어뜨림 | droplet | nature | 슬픈 | 땀 | 눈물 | water | weather',
    ),
    Emoji(
      '🫧',
      'bubble | bubbles | burp | clean | floating | pearl | soap | underwater',
    ),
    Emoji(
      '🌊',
      'nature | ocean | surf | surfer | surfing | water | 손흔들기',
    ),
    Emoji(
      '🎄',
      '축하 | Christmas | tree',
    ),
    Emoji(
      '✨',
      '* | magic | sparkle | sparkles | 별',
    ),
    Emoji(
      '🎋',
      'banner | 축하 | Japanese | tanabata | tree',
    ),
    Emoji(
      '🎍',
      'bamboo | 축하 | decoration | Japanese | pine | plant',
    ),
  ]),

// ======================================================= Category.FOODS
  CategoryEmoji(Category.FOODS, [
    Emoji(
      '🍇',
      'Dionysus | fruit | grape | grapes',
    ),
    Emoji(
      '🍈',
      'cantaloupe | fruit | melon',
    ),
    Emoji(
      '🍉',
      'fruit | watermelon',
    ),
    Emoji(
      '🍊',
      'c | citrus | fruit | nectarine | orange | tangerine | vitamin',
    ),
    Emoji(
      '🍋',
      'citrus | fruit | lemon | sour',
    ),
    Emoji(
      '🍌',
      'banana | fruit | potassium',
    ),
    Emoji(
      '🍍',
      'colada | fruit | pina | pineapple | tropical',
    ),
    Emoji(
      '🥭',
      '음식 | fruit | mango | tropical',
    ),
    Emoji(
      '🍎',
      'apple | diet | 음식 | fruit | health | 빨간 | ripe',
    ),
    Emoji(
      '🍏',
      'apple | fruit | green',
    ),
    Emoji(
      '🍐',
      'fruit | pear',
    ),
    Emoji(
      '🍑',
      'fruit | peach',
    ),
    Emoji(
      '🍒',
      'berries | cherries | cherry | fruit | 빨간',
    ),
    Emoji(
      '🍓',
      'berry | fruit | strawberry',
    ),
    Emoji(
      '🥝',
      '음식 | fruit | kiwi',
    ),
    Emoji(
      '🍅',
      '음식 | fruit | tomato | vegetable',
    ),
    Emoji(
      '🥥',
      'coconut | colada | 손바닥 | piña',
    ),
    Emoji(
      '🥑',
      'avocado | 음식 | fruit',
    ),
    Emoji(
      '🍆',
      'aubergine | eggplant | vegetable',
    ),
    Emoji(
      '🥔',
      '음식 | potato | vegetable',
    ),
    Emoji(
      '🥕',
      'carrot | 음식 | vegetable',
    ),
    Emoji(
      '🌽',
      'corn | crops | 귀 | farm | maize | maze',
    ),
    Emoji(
      '🌶️',
      '더운 | pepper',
    ),
    Emoji(
      '🥒',
      'cucumber | 음식 | pickle | vegetable',
    ),
    Emoji(
      '🥬',
      'bok | burgers | cabbage | choy | green | kale | leafy | lettuce | salad',
    ),
    Emoji(
      '🥦',
      'broccoli | cabbage | wild',
    ),
    Emoji(
      '🍄',
      'fungus | mushroom | toadstool',
    ),
    Emoji(
      '🥜',
      '음식 | nut | peanut | peanuts | vegetable',
    ),
    Emoji(
      '🫘',
      'beans | 음식 | kidney | legume | 작은',
    ),
    Emoji(
      '🌰',
      'almond | chestnut | plant',
    ),
    Emoji(
      '🍞',
      'bread | carbs | 음식 | grain | loaf | restaurant | toast | wheat',
    ),
    Emoji(
      '🥐',
      'bread | breakfast | crescent | croissant | 음식 | french | roll',
    ),
    Emoji(
      '🥖',
      'baguette | bread | 음식 | french',
    ),
    Emoji(
      '🥨',
      'convoluted | pretzel | twisted',
    ),
    Emoji(
      '🥯',
      'bagel | bakery | bread | breakfast | schmear',
    ),
    Emoji(
      '🥞',
      'breakfast | crêpe | 음식 | hotcake | pancake | pancakes',
    ),
    Emoji(
      '🧀',
      'cheese | wedge',
    ),
    Emoji(
      '🍖',
      '뼈 | meat',
    ),
    Emoji(
      '🍗',
      '뼈 | chicken | drumstick | 배고픈 | 다리 | poultry | turkey',
    ),
    Emoji(
      '🥩',
      'chop | cut | lambchop | meat | porkchop | 빨간 | steak',
    ),
    Emoji(
      '🥓',
      'bacon | breakfast | 음식 | meat',
    ),
    Emoji(
      '🍔',
      'burger | 먹다 | fast | 음식 | hamburger | 배고픈',
    ),
    Emoji(
      '🍟',
      'fast | 음식 | french | fries',
    ),
    Emoji(
      '🍕',
      'cheese | 음식 | 배고픈 | pepperoni | pizza | slice',
    ),
    Emoji(
      '🌭',
      '강아지 | frankfurter | 더운 | hotdog | sausage',
    ),
    Emoji(
      '🥪',
      'bread | sandwich',
    ),
    Emoji(
      '🌮',
      'mexican | taco',
    ),
    Emoji(
      '🌯',
      'burrito | mexican | wrap',
    ),
    Emoji(
      '🥙',
      'falafel | flatbread | 음식 | gyro | kebab | stuffed',
    ),
    Emoji(
      '🍳',
      'breakfast | cooking | easy | egg | fry | frying | 넘치는 | pan | restaurant | side | sunny | 위',
    ),
    Emoji(
      '🥘',
      'casserole | 음식 | paella | pan | shallow',
    ),
    Emoji(
      '🍲',
      '음식 | pot | soup | stew',
    ),
    Emoji(
      '🥣',
      'bowl | breakfast | cereal | congee | oatmeal | porridge | spoon',
    ),
    Emoji(
      '🥗',
      '음식 | green | salad',
    ),
    Emoji(
      '🍿',
      'corn | movie | pop | popcorn',
    ),
    Emoji(
      '🧂',
      'condiment | flavor | 화남 | salt | salty | shaker | 맛 | 화남',
    ),
    Emoji(
      '🥫',
      'can | canned | 음식',
    ),
    Emoji(
      '🫙',
      'condiment | container | empty | jar | nothing | sauce | store',
    ),
    Emoji(
      '🍱',
      'bento | box | 음식',
    ),
    Emoji(
      '🍘',
      'cracker | 음식 | rice',
    ),
    Emoji(
      '🍙',
      'ball | 음식 | Japanese | rice',
    ),
    Emoji(
      '🍚',
      'cooked | 음식 | rice',
    ),
    Emoji(
      '🍛',
      'curry | 음식 | rice',
    ),
    Emoji(
      '🍜',
      'bowl | chopsticks | 음식 | noodle | pho | ramen | soup | steaming',
    ),
    Emoji(
      '🍝',
      '음식 | meatballs | pasta | restaurant | spaghetti',
    ),
    Emoji(
      '🍠',
      '음식 | potato | roasted | 달콤',
    ),
    Emoji(
      '🍢',
      '음식 | kebab | oden | restaurant | seafood | skewer | stick',
    ),
    Emoji(
      '🍣',
      '음식 | sushi',
    ),
    Emoji(
      '🍤',
      'fried | prawn | shrimp | tempura',
    ),
    Emoji(
      '🍥',
      'cake | fish | 음식 | pastry | restaurant | swirl',
    ),
    Emoji(
      '🥮',
      'autumn | cake | festival | moon | yuèbǐng',
    ),
    Emoji(
      '🍡',
      'dango | dessert | Japanese | skewer | stick | 달콤',
    ),
    Emoji(
      '🥟',
      'dumpling | empanada | gyōza | jiaozi | pierogi | potsticker',
    ),
    Emoji(
      '🥠',
      'cookie | fortune | prophecy',
    ),
    Emoji(
      '🥡',
      'box | chopsticks | delivery | 음식 | oyster | pail | takeout',
    ),
    Emoji(
      '🍦',
      'cream | dessert | 음식 | ice | icecream | restaurant | serve | soft | 달콤',
    ),
    Emoji(
      '🍧',
      'dessert | ice | restaurant | shaved | 달콤',
    ),
    Emoji(
      '🍨',
      'cream | dessert | 음식 | ice | restaurant | 달콤',
    ),
    Emoji(
      '🍩',
      'breakfast | dessert | donut | doughnut | 음식 | 달콤',
    ),
    Emoji(
      '🍪',
      'chip | chocolate | cookie | dessert | 달콤',
    ),
    Emoji(
      '🎂',
      '생일 | 생일 | cake | 축하 | dessert | 행복 | pastry | 달콤',
    ),
    Emoji(
      '🍰',
      'cake | dessert | pastry | shortcake | slice | 달콤',
    ),
    Emoji(
      '🧁',
      'bakery | cupcake | dessert | sprinkles | sugar | 달콤 | treat',
    ),
    Emoji(
      '🥧',
      'apple | filling | fruit | meat | pastry | pie | 호박 | slice',
    ),
    Emoji(
      '🍫',
      'bar | candy | chocolate | dessert | 할로윈 | 달콤 | 이',
    ),
    Emoji(
      '🍬',
      'candy | cavities | dessert | 할로윈 | restaurant | 달콤 | 이 | wrapper',
    ),
    Emoji(
      '🍭',
      'candy | dessert | 음식 | lollipop | restaurant | 달콤',
    ),
    Emoji(
      '🍮',
      'custard | dessert | pudding | 달콤',
    ),
    Emoji(
      '🍯',
      'barrel | bear | 음식 | honey | honeypot | jar | pot | 달콤',
    ),
    Emoji(
      '🍼',
      '아기 | 아기 | birth | born | bottle | drink | 영아 | milk | 갓난아이',
    ),
    Emoji(
      '🥛',
      'drink | glass | milk',
    ),
    Emoji(
      '🫗',
      'accident | drink | empty | glass | 액체 | 앗 | pour | pouring | spill | water',
    ),
    Emoji(
      '☕',
      'beverage | cafe | caffeine | chai | coffee | drink | 더운 | morning | steaming | tea',
    ),
    Emoji(
      '🍵',
      'beverage | cup | drink | handle | oolong | tea | teacup',
    ),
    Emoji(
      '🧉',
      'drink | mate',
    ),
    Emoji(
      '🍶',
      'bar | beverage | bottle | cup | drink | restaurant | sake',
    ),
    Emoji(
      '🍾',
      'bar | bottle | cork | drink | popping',
    ),
    Emoji(
      '🍷',
      'alcohol | bar | beverage | booze | club | drink | drinking | drinks | glass | restaurant | wine',
    ),
    Emoji(
      '🍸',
      'alcohol | bar | booze | club | cocktail | drink | drinking | drinks | glass | 화남 | martini | men',
    ),
    Emoji(
      '🍹',
      'alcohol | bar | booze | club | cocktail | drink | drinking | drinks | 취한 | mai | 파티 | tai | tropical | tropics',
    ),
    Emoji(
      '🍺',
      'alcohol | ale | bar | beer | booze | drink | drinking | drinks | mug | octoberfest | oktoberfest | pint | stein | summer',
    ),
    Emoji(
      '🍻',
      'alcohol | bar | beer | booze | bottoms | cheers | clink | clinking | drinking | drinks | mugs',
    ),
    Emoji(
      '🥂',
      '축하 | clink | clinking | drink | glass | 안경',
    ),
    Emoji(
      '🥃',
      'glass | liquor | scotch | shot | tumbler | whiskey | whisky',
    ),
    Emoji(
      '🥤',
      'cup | drink | juice | malt | soda | soft | straw | water',
    ),
    Emoji(
      '🥢',
      'chopsticks | hashi | jeotgarak | kuaizi',
    ),
    Emoji(
      '🍽️',
      'cooking | dinner | 먹다 | fork | knife | plate',
    ),
    Emoji(
      '🍴',
      'breakfast | breaky | cooking | cutlery | 맛있는 | dinner | 먹다 | feed | 음식 | fork | 배고픈 | knife | lunch | restaurant | 맛 | 맛있어',
    ),
    Emoji(
      '🥄',
      '먹다 | spoon | tableware',
    ),
  ]),

// ======================================================= Category.TRAVEL
  CategoryEmoji(Category.TRAVEL, [
    Emoji(
      '🗾',
      'Japan | map',
    ),
    Emoji(
      '🏔️',
      '추운 | mountain | snow | snow-capped',
    ),
    Emoji(
      '⛰️',
      'mountain',
    ),
    Emoji(
      '🌋',
      'eruption | mountain | nature | volcano',
    ),
    Emoji(
      '🗻',
      'fuji | mount | mountain | nature',
    ),
    Emoji(
      '🏕️',
      'camping',
    ),
    Emoji(
      '🏖️',
      '해변 | umbrella',
    ),
    Emoji(
      '🏜️',
      'desert',
    ),
    Emoji(
      '🏝️',
      'desert | island',
    ),
    Emoji(
      '🏞️',
      'national | park',
    ),
    Emoji(
      '🏟️',
      'stadium',
    ),
    Emoji(
      '🏛️',
      'building | classical',
    ),
    Emoji(
      '🏗️',
      'building | construction | crane',
    ),
    Emoji(
      '🏘️',
      'house | houses',
    ),
    Emoji(
      '🏚️',
      'derelict | home | house',
    ),
    Emoji(
      '🏠',
      'building | country | 하트 | home | house | ranch | settle | simple | suburban | suburbia | where',
    ),
    Emoji(
      '🏡',
      'building | country | garden | 하트 | home | house | ranch | settle | simple | suburban | suburbia | where',
    ),
    Emoji(
      '🏢',
      'building | city | cubical | 잘했어 | 사무실',
    ),
    Emoji(
      '🏣',
      'building | Japanese | 사무실 | post',
    ),
    Emoji(
      '🏤',
      'building | European | 사무실 | post',
    ),
    Emoji(
      '🏥',
      'building | 의사 | hospital | 약',
    ),
    Emoji(
      '🏦',
      'bank | building',
    ),
    Emoji(
      '🏨',
      'building | hotel',
    ),
    Emoji(
      '🏩',
      'building | hotel | 사랑',
    ),
    Emoji(
      '🏪',
      '24 | building | convenience | hours | store',
    ),
    Emoji(
      '🏫',
      'building | school',
    ),
    Emoji(
      '🏬',
      'building | department | store',
    ),
    Emoji(
      '🏭',
      'building | 공장',
    ),
    Emoji(
      '🏯',
      'building | castle | Japanese',
    ),
    Emoji(
      '🏰',
      'building | castle | European',
    ),
    Emoji(
      '💒',
      'chapel | hitched | nuptials | 로맨스 | wedding',
    ),
    Emoji(
      '🗼',
      'Tokyo | tower',
    ),
    Emoji(
      '🗽',
      'liberty | Liberty | new | ny | nyc | statue | Statue | york',
    ),
    Emoji(
      '⛪',
      'bless | chapel | Christian | church | 교차 | religion',
    ),
    Emoji(
      '🕌',
      'islam | masjid | mosque | Muslim | religion',
    ),
    Emoji(
      '🕍',
      'Jew | Jewish | judaism | religion | synagogue | temple',
    ),
    Emoji(
      '⛩️',
      'religion | shinto | shrine',
    ),
    Emoji(
      '🕋',
      'hajj | islam | kaaba | Muslim | religion | umrah',
    ),
    Emoji(
      '⛲',
      'fountain',
    ),
    Emoji(
      '⛺',
      'camping | tent',
    ),
    Emoji(
      '🌁',
      'fog | foggy',
    ),
    Emoji(
      '🌃',
      '밤 | 별 | stars',
    ),
    Emoji(
      '🏙️',
      'city | cityscape',
    ),
    Emoji(
      '🌄',
      'morning | mountains | 넘치는 | sun | sunrise',
    ),
    Emoji(
      '🌅',
      'morning | nature | sun | sunrise',
    ),
    Emoji(
      '🌆',
      '에게 | building | city | cityscape | dusk | evening | landscape | sun | sunset',
    ),
    Emoji(
      '🌇',
      'building | dusk | sun | sunset',
    ),
    Emoji(
      '🌉',
      '에게 | bridge | 밤',
    ),
    Emoji(
      '🎠',
      'carousel | entertainment | horse',
    ),
    Emoji(
      '🎡',
      'amusement | ferris | park | theme | wheel',
    ),
    Emoji(
      '🎢',
      'amusement | coaster | park | roller | theme',
    ),
    Emoji(
      '🚂',
      'caboose | engine | locomotive | railway | 증기 | train | trains | travel',
    ),
    Emoji(
      '🚃',
      'car | electric | railway | train | tram | travel | trolleybus',
    ),
    Emoji(
      '🚄',
      'high-speed | railway | shinkansen | speed | train',
    ),
    Emoji(
      '🚅',
      'bullet | high-speed | 코 | railway | shinkansen | speed | train | travel',
    ),
    Emoji(
      '🚆',
      'arrived | choo | railway | train',
    ),
    Emoji(
      '🚇',
      'metro | subway | travel',
    ),
    Emoji(
      '🚈',
      'arrived | light | monorail | rail | railway',
    ),
    Emoji(
      '🚉',
      'railway | station | train',
    ),
    Emoji(
      '🚊',
      'tram | trolleybus',
    ),
    Emoji(
      '🚝',
      'monorail | vehicle',
    ),
    Emoji(
      '🚞',
      'car | mountain | railway | trip',
    ),
    Emoji(
      '🚋',
      'bus | car | tram | trolley | trolleybus',
    ),
    Emoji(
      '🚌',
      'bus | school | vehicle',
    ),
    Emoji(
      '🚍',
      'bus | cars | 맞은편',
    ),
    Emoji(
      '🚎',
      'bus | tram | trolley | trolleybus',
    ),
    Emoji(
      '🚐',
      'bus | drive | minibus | van | vehicle',
    ),
    Emoji(
      '🚑',
      'ambulance | emergency | vehicle',
    ),
    Emoji(
      '🚒',
      'engine | fire | truck',
    ),
    Emoji(
      '🚓',
      '5–0 | car | cops | patrol | 경찰',
    ),
    Emoji(
      '🚔',
      'car | 맞은편 | 경찰',
    ),
    Emoji(
      '🚕',
      'cab | cabbie | car | drive | taxi | vehicle | yellow',
    ),
    Emoji(
      '🚖',
      'cab | cabbie | cars | drove | hail | 맞은편 | taxi | yellow',
    ),
    Emoji(
      '🚗',
      'automobile | car | driving | vehicle',
    ),
    Emoji(
      '🚘',
      'automobile | car | cars | drove | 맞은편 | vehicle',
    ),
    Emoji(
      '🚚',
      'car | delivery | drive | truck | vehicle',
    ),
    Emoji(
      '🚛',
      'articulated | car | drive | lorry | move | semi | truck | vehicle',
    ),
    Emoji(
      '🚜',
      'tractor | vehicle',
    ),
    Emoji(
      '🏎️',
      'car | racing | zoom',
    ),
    Emoji(
      '🏍️',
      'motorcycle | racing',
    ),
    Emoji(
      '🛵',
      'motor | scooter',
    ),
    Emoji(
      '🚲',
      'bicycle | bike | class | cycle | cycling | cyclist | gang | ride | spin | spinning',
    ),
    Emoji(
      '🛴',
      '차다 | scooter',
    ),
    Emoji(
      '🚏',
      'bus | busstop | 멈춤',
    ),
    Emoji(
      '🛤️',
      'railway | track | train',
    ),
    Emoji(
      '⛽',
      'diesel | fuel | fuelpump | gas | gasoline | pump | station',
    ),
    Emoji(
      '🛞',
      'car | circle | tire | turn | vehicle | wheel',
    ),
    Emoji(
      '🚨',
      'alarm | alert | beacon | car | emergency | light | 경찰 | revolving | siren',
    ),
    Emoji(
      '🚥',
      'horizontal | intersection | light | signal | 멈춤 | stoplight | traffic',
    ),
    Emoji(
      '🚦',
      'drove | intersection | light | signal | 멈춤 | stoplight | traffic | vertical',
    ),
    Emoji(
      '🚧',
      'barrier | construction',
    ),
    Emoji(
      '⚓',
      'anchor | ship | tool',
    ),
    Emoji(
      '⛵',
      'boat | resort | sailboat | sailing | sea | yacht',
    ),
    Emoji(
      '🚤',
      'billionaire | boat | lake | luxury | millionaire | speedboat | summer | travel',
    ),
    Emoji(
      '🛳️',
      'passenger | ship',
    ),
    Emoji(
      '⛴️',
      'boat | ferry | passenger',
    ),
    Emoji(
      '🛥️',
      'boat | motor | motorboat',
    ),
    Emoji(
      '🚢',
      'boat | passenger | ship | travel',
    ),
    Emoji(
      '🛟',
      'buoy | float | life | lifesaver | preserver | rescue | ring | safety | save | saver | swim',
    ),
    Emoji(
      '✈️',
      'aeroplane | airplane | fly | flying | jet | plane | travel',
    ),
    Emoji(
      '🛩️',
      'aeroplane | airplane | plane | 작은',
    ),
    Emoji(
      '🛫',
      'aeroplane | airplane | check-in | departure | departures | plane',
    ),
    Emoji(
      '🛬',
      'aeroplane | airplane | arrival | arrivals | arriving | landing | plane',
    ),
    Emoji(
      '💺',
      'chair | seat',
    ),
    Emoji(
      '🚁',
      'copter | helicopter | roflcopter | travel | vehicle',
    ),
    Emoji(
      '🚟',
      'railway | suspension',
    ),
    Emoji(
      '🚠',
      'cable | cableway | gondola | 들다 | mountain | ski',
    ),
    Emoji(
      '🚡',
      'aerial | cable | car | gondola | ropeway | tramway',
    ),
    Emoji(
      '🛰️',
      'satellite | 우주',
    ),
    Emoji(
      '🚀',
      'launch | 로켓 | rockets | 우주 | travel',
    ),
    Emoji(
      '🛸',
      'aliens | extra | flying | saucer | terrestrial | UFO',
    ),
    Emoji(
      '🌠',
      'falling | 밤 | shooting | 우주 | 별',
    ),
    Emoji(
      '🌌',
      'milky | 우주 | 완전',
    ),
    Emoji(
      '⛱️',
      'ground | rain | sun | umbrella',
    ),
    Emoji(
      '🎆',
      '쾅 | 축하 | entertainment | fireworks | yolo',
    ),
    Emoji(
      '🎇',
      '쾅 | 축하 | fireworks | sparkle | sparkler',
    ),
    Emoji(
      '🎑',
      '축하 | ceremony | moon | viewing',
    ),
    Emoji(
      '🗿',
      '얼굴 | moai | moyai | statue | stoneface | travel',
    ),
    Emoji(
      '🛂',
      'control | passport',
    ),
    Emoji(
      '🛃',
      'customs | packing',
    ),
    Emoji(
      '🛄',
      'arrived | baggage | bags | case | checked | claim | journey | packing | plane | ready | travel | trip',
    ),
    Emoji(
      '🛅',
      'baggage | case | 왼쪽 | locker | luggage',
    ),
  ]),

// ======================================================= Category.ACTIVITIES
  CategoryEmoji(Category.ACTIVITIES, [
    Emoji('🧗‍♂️',
        'climb | climber | climbing | mountain | 사람 | 락 | scale | up male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧗‍♀️',
        'climb | climber | climbing | mountain | 사람 | 락 | scale | up female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🏇', 'horse | jockey | racehorse | racing | riding | sport',
        hasSkinTone: true),
    Emoji(
      '⛷️',
      'ski | skier | snow',
    ),
    Emoji(
      '🏂',
      'ski | snow | snowboard | snowboarder | sport',
    ),
    Emoji('🏌️‍♂️',
        'ball | birdie | caddy | driving | golf | golfing | green | 사람 | pga | putt | range | tee male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🏌️‍♀️',
        'ball | birdie | caddy | driving | golf | golfing | green | 사람 | pga | putt | range | tee female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🏄‍♂️',
        '해변 | ocean | 사람 | sport | surf | surfer | surfing | swell | waves male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🏄‍♀️',
        '해변 | ocean | 사람 | sport | surf | surfer | surfing | swell | waves female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🚣‍♂️',
        'boat | canoe | cruise | fishing | lake | oar | paddle | 사람 | raft | river | row | rowboat | rowing male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🚣‍♀️',
        'boat | canoe | cruise | fishing | lake | oar | paddle | 사람 | raft | river | row | rowboat | rowing female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🏊‍♂️',
        'freestyle | 사람 | sport | swim | swimmer | swimming | triathlon male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🏊‍♀️',
        'freestyle | 사람 | sport | swim | swimmer | swimming | triathlon female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('⛹️‍♂️',
        'athletic | ball | basketball | bouncing | championship | dribble | net | 사람 | player | throw male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('⛹️‍♀️',
        'athletic | ball | basketball | bouncing | championship | dribble | net | 사람 | player | throw female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🏋️‍♂️',
        'barbell | bodybuilder | deadlift | lifter | lifting | 사람 | powerlifting | weight | weightlifter | weights | workout male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🏋️‍♀️',
        'barbell | bodybuilder | deadlift | lifter | lifting | 사람 | powerlifting | weight | weightlifter | weights | workout female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🚴‍♂️',
        'bicycle | bicyclist | bike | biking | cycle | cyclist | 사람 | riding | sport male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🚴‍♀️',
        'bicycle | bicyclist | bike | biking | cycle | cyclist | 사람 | riding | sport female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🚵‍♂️',
        'bicycle | bicyclist | bike | biking | cycle | cyclist | mountain | 사람 | riding | sport male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🚵‍♀️',
        'bicycle | bicyclist | bike | biking | cycle | cyclist | mountain | 사람 | riding | sport female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤸‍♂️',
        'active | cartwheel | cartwheeling | 신남 | 뒤집기 | gymnastics | 행복 | 사람 | somersault male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤸‍♀️',
        'active | cartwheel | cartwheeling | 신남 | 뒤집기 | gymnastics | 행복 | 사람 | somersault female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤼‍♂️',
        'combat | duel | grapple | people | ring | tournament | wrestle | wrestling male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤼‍♀️',
        'combat | duel | grapple | people | ring | tournament | wrestle | wrestling female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤽‍♂️',
        '사람 | playing | polo | sport | swimming | water | waterpolo male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤽‍♀️',
        '사람 | playing | polo | sport | swimming | water | waterpolo female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤾‍♂️',
        'athletics | ball | 잡다 | chuck | handball | hurl | lob | 사람 | pitch | playing | sport | 던지다 | toss male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤾‍♀️',
        'athletics | ball | 잡다 | chuck | handball | hurl | lob | 사람 | pitch | playing | sport | 던지다 | toss female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🤹‍♂️',
        'act | balance | balancing | handle | juggle | juggling | manage | multitask | 사람 | skill male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🤹‍♀️',
        'act | balance | balancing | handle | juggle | juggling | manage | multitask | 사람 | skill female | 사인 | 여자',
        hasSkinTone: true),
    Emoji('🧘‍♂️',
        '교차 | legged | legs | lotus | 명상 | 피스 | 사람 | position | 쉬어 | serenity | yoga | yogi | zen male | 남자 | 사인',
        hasSkinTone: true),
    Emoji('🧘‍♀️',
        '교차 | legged | legs | lotus | 명상 | 피스 | 사람 | position | 쉬어 | serenity | yoga | yogi | zen female | 사인 | 여자',
        hasSkinTone: true),
    Emoji(
      '🎪',
      'circus | tent',
    ),
    Emoji(
      '🛹',
      'board | skate | skateboard | skater | wheels',
    ),
    Emoji(
      '🎗️',
      '축하 | reminder | ribbon',
    ),
    Emoji(
      '🎟️',
      'admission | ticket | tickets',
    ),
    Emoji(
      '🎫',
      'admission | stub | ticket',
    ),
    Emoji(
      '🎖️',
      'award | 축하 | medal | military',
    ),
    Emoji(
      '🏆',
      'champion | champs | prize | 완벽 | sport | trophy | 승리 | 승리 | winning',
    ),
    Emoji(
      '🏅',
      'award | gold | medal | sports | winner',
    ),
    Emoji(
      '🥇',
      '1st | first | gold | medal | place',
    ),
    Emoji(
      '🥈',
      '2nd | medal | place | second | silver',
    ),
    Emoji(
      '🥉',
      '3rd | bronze | medal | place | third',
    ),
    Emoji(
      '⚽',
      'ball | football | futbol | soccer | sport',
    ),
    Emoji(
      '⚾',
      'ball | baseball | sport',
    ),
    Emoji(
      '🥎',
      'ball | glove | softball | sports | underarm',
    ),
    Emoji(
      '🏀',
      'ball | basketball | hoop | sport',
    ),
    Emoji(
      '🏐',
      'ball | 게임 | volleyball',
    ),
    Emoji(
      '🏈',
      'american | ball | bowl | football | sport | super',
    ),
    Emoji(
      '🏉',
      'ball | football | rugby | sport',
    ),
    Emoji(
      '🎾',
      'ball | racquet | sport | tennis',
    ),
    Emoji(
      '🥏',
      'disc | flying | ultimate',
    ),
    Emoji(
      '🎳',
      'ball | bowling | 게임 | sport | strike',
    ),
    Emoji(
      '🏏',
      'ball | bat | cricket | 게임',
    ),
    Emoji(
      '🏑',
      'ball | field | 게임 | hockey | stick',
    ),
    Emoji(
      '🏒',
      '게임 | hockey | ice | puck | stick',
    ),
    Emoji(
      '🥍',
      'ball | goal | lacrosse | sports | stick',
    ),
    Emoji(
      '🏓',
      'ball | bat | 게임 | paddle | ping | pingpong | pong | table | tennis',
    ),
    Emoji(
      '🏸',
      'badminton | birdie | 게임 | racquet | shuttlecock',
    ),
    Emoji(
      '🪃',
      'boomerang | rebound | repercussion | weapon',
    ),
    Emoji(
      '🥅',
      'goal | net',
    ),
    Emoji(
      '⛳',
      'flag | golf | hole | sport',
    ),
    Emoji(
      '🪁',
      'fly | kite | soar',
    ),
    Emoji(
      '🛝',
      'amusement | park | play | playground | playing | 슬라이드 | sliding | theme',
    ),
    Emoji(
      '🏹',
      'archer | archery | arrow | 인사 | Sagittarius | tool | weapon | zodiac',
    ),
    Emoji(
      '🎣',
      'entertainment | fish | fishing | pole | sport',
    ),
    Emoji(
      '🤿 ',
      'diving | 가면 | scuba | snorkeling',
    ),
    Emoji(
      '🥊',
      'boxing | glove',
    ),
    Emoji(
      '🥋',
      'arts | judo | karate | martial | taekwondo | uniform',
    ),
    Emoji(
      '🎽',
      'athletics | running | sash | shirt',
    ),
    Emoji(
      '🛼',
      'blades | roller | skate | skates | sport',
    ),
    Emoji(
      '🛷',
      'luge | sled | sledge | sleigh | snow | toboggan',
    ),
    Emoji(
      '⛸️',
      'ice | skate | skating',
    ),
    Emoji(
      '🥌',
      'curling | 게임 | 락 | stone',
    ),
    Emoji(
      '🎿',
      'ski | skis | snow | sport',
    ),
    Emoji(
      '🎯',
      'bull | bullseye | dart | direct | entertainment | 게임 | hit | target',
    ),
    Emoji(
      '🎱',
      '8 | 8ball | ball | billiard | eight | 게임 | pool',
    ),
    Emoji(
      '🎮',
      'controller | entertainment | 게임 | video',
    ),
    Emoji(
      '🎰',
      'casino | gamble | gambling | 게임 | machine | slot | slots',
    ),
    Emoji(
      '🎲',
      'dice | die | entertainment | 게임',
    ),
    Emoji(
      '🧩',
      'clue | interlocking | jigsaw | piece | puzzle',
    ),
    Emoji(
      '♟️',
      'chess | dupe | expendable | pawn',
    ),
    Emoji(
      '🎭',
      '배우 | actress | art | arts | entertainment | 가면 | performing | theater | theatre | thespian',
    ),
    Emoji(
      '🎨',
      'art | 예술가 | artsy | arty | colorful | creative | entertainment | museum | painter | painting | 팔레트',
    ),
    Emoji(
      '🧵',
      'needle | sewing | spool | string | thread',
    ),
    Emoji(
      '🧶',
      'ball | crochet | knit | yarn',
    ),
    Emoji(
      '🎼',
      'music | musical | note | score',
    ),
    Emoji(
      '🎤',
      'karaoke | mic | microphone | music | sing | 소리',
    ),
    Emoji(
      '🎧',
      'earbud | headphone | 소리',
    ),
    Emoji(
      '🎷',
      'instrument | music | sax | saxophone',
    ),
    Emoji(
      '🎸',
      'guitar | instrument | music | strat',
    ),
    Emoji(
      '🎹',
      'instrument | keyboard | music | musical | piano',
    ),
    Emoji(
      '🎺',
      'instrument | music | trumpet',
    ),
    Emoji(
      '🎻',
      'instrument | music | violin',
    ),
    Emoji(
      '🥁',
      'drum | drumsticks | music',
    ),
    Emoji(
      '🎬',
      'action | board | clapper | movie',
    ),
  ]),

// ======================================================= Category.OBJECTS
  CategoryEmoji(Category.OBJECTS, [
    Emoji(
      '💌',
      '하트 | letter | 사랑 | mail | 로맨스 | valentine',
    ),
    Emoji(
      '🕳️',
      'hole',
    ),
    Emoji(
      '💣',
      'bomb | 쾅 | 만화 | dangerous | explosion | 더운',
    ),
    Emoji(
      '🛀',
      'bath | bathtub | 사람 | taking | tub',
    ),
    Emoji(
      '🛌',
      '침대 | 취침 | 좋은 | 잘자 | hotel | 낮잠 | 밤 | 사람 | 잠 | 피곤 | zzz',
    ),
    Emoji(
      '🏺',
      'amphora | Aquarius | cooking | drink | jug | tool | weapon | zodiac',
    ),
    Emoji(
      '🗺️',
      'map | world',
    ),
    Emoji(
      '🧭',
      'compass | direction | magnetic | navigation | orienteering',
    ),
    Emoji(
      '🧱',
      'brick | bricks | clay | mortar | wall',
    ),
    Emoji(
      '💈',
      'barber | cut | fresh | haircut | pole | shave',
    ),
    Emoji(
      '🛢️',
      'drum | oil',
    ),
    Emoji(
      '🛎️',
      'bell | bellhop | hotel',
    ),
    Emoji(
      '🧳',
      'bag | luggage | packing | roller | suitcase | travel',
    ),
    Emoji(
      '⌛',
      '끝 | hourglass | sand | 시간 | timer',
    ),
    Emoji(
      '⏳',
      '끝 | flowing | hourglass | hours | 안 | sand | timer | waiting | yolo',
    ),
    Emoji(
      '⌚',
      'clock | 시간 | watch',
    ),
    Emoji(
      '⏰',
      'alarm | clock | hours | hrs | late | 시간 | waiting',
    ),
    Emoji(
      '⏱️',
      'clock | stopwatch | 시간',
    ),
    Emoji(
      '⏲️',
      'clock | timer',
    ),
    Emoji(
      '🕰️',
      'clock | mantelpiece | 시간',
    ),
    Emoji(
      '🌡️',
      '체온계 | weather',
    ),
    Emoji(
      '⛱️',
      'ground | rain | sun | umbrella',
    ),
    Emoji(
      '🧨',
      'dynamite | explosive | fire | firecracker | fireworks | light | pop | popping | spark',
    ),
    Emoji(
      '🎈',
      'balloon | 생일 | 축하 | 축하',
    ),
    Emoji(
      '🎉',
      '최고 | 생일 | 축하 | 축하 | 신남 | 만세 | 파티 | popper | tada | woohoo',
    ),
    Emoji(
      '🎊',
      'ball | 축하 | 축하 | confetti | 파티 | woohoo',
    ),
    Emoji(
      '🎎',
      '축하 | doll | dolls | festival | Japanese',
    ),
    Emoji(
      '🎏',
      'carp | 축하 | streamer',
    ),
    Emoji(
      '🎐',
      'bell | 축하 | chime | wind',
    ),
    Emoji(
      '🪩',
      'ball | dance | disco | glitter | mirror | 파티',
    ),
    Emoji(
      '🧧',
      'envelope | gift | 좋은 | hóngbāo | lai | 행운 | 돈 | 빨간 | 보다',
    ),
    Emoji(
      '🎀',
      '축하 | ribbon',
    ),
    Emoji(
      '🎁',
      '생일 | 인사 | box | 축하 | christmas | gift | present | 놀람 | wrapped',
    ),
    Emoji(
      '🔮',
      'ball | crystal | 요정 | 동화 | 판타지 | fortune | future | magic | 이야기 | tool',
    ),
    Emoji(
      '🧿',
      'amulet | bead | 파란 | charm | evil-eye | nazar | talisman',
    ),
    Emoji(
      '🪬',
      'amulet | Fatima | fortune | guide | hamsa | 손 | Mary | Miriam | 손바닥 | protect | protection',
    ),
    Emoji(
      '🕹️',
      '게임 | joystick | video | videogame',
    ),
    Emoji(
      '🧸',
      'bear | plaything | plush | stuffed | teddy | toy',
    ),
    Emoji(
      '🖼️',
      'art | frame | framed | museum | painting | picture',
    ),
    Emoji(
      '🧵',
      'needle | sewing | spool | string | thread',
    ),
    Emoji(
      '🧶',
      'ball | crochet | knit | yarn',
    ),
    Emoji(
      '🛍️',
      'bag | bags | hotel | shopping',
    ),
    Emoji(
      '📿',
      'beads | clothing | necklace | 기도 | religion',
    ),
    Emoji(
      '💎',
      'diamond | engagement | gem | jewel | 돈 | 로맨스 | stone | wedding',
    ),
    Emoji(
      '📯',
      '뿔 | post | postal',
    ),
    Emoji(
      '🎙️',
      'mic | microphone | music | studio',
    ),
    Emoji(
      '🎚️',
      'level | music | slider',
    ),
    Emoji(
      '🎛️',
      'control | knobs | music',
    ),
    Emoji(
      '📻',
      'entertainment | radio | tbt | video',
    ),
    Emoji(
      '📱',
      'cell | communication | mobile | 폰 | telephone',
    ),
    Emoji(
      '📲',
      'arrow | build | 전화 | cell | communication | mobile | 폰 | receive | telephone',
    ),
    Emoji(
      '☎️',
      '폰 | telephone',
    ),
    Emoji(
      '📞',
      'communication | 폰 | receiver | telephone | voip',
    ),
    Emoji(
      '📟',
      'communication | pager',
    ),
    Emoji(
      '📠',
      'communication | fax | machine',
    ),
    Emoji(
      '🔋',
      'battery',
    ),
    Emoji(
      '🪫',
      'battery | drained | electronic | energy | low | power',
    ),
    Emoji(
      '🔌',
      'electric | electricity | plug',
    ),
    Emoji(
      '💻',
      '컴퓨터 | laptop | 사무실 | pc | personal',
    ),
    Emoji(
      '🖥️',
      '컴퓨터 | desktop | monitor',
    ),
    Emoji(
      '🖨️',
      '컴퓨터 | printer',
    ),
    Emoji(
      '⌨️',
      '컴퓨터 | keyboard',
    ),
    Emoji(
      '🖱️',
      '컴퓨터 | mouse',
    ),
    Emoji(
      '🖲️',
      '컴퓨터 | trackball',
    ),
    Emoji(
      '💽',
      '컴퓨터 | disk | minidisk | optical',
    ),
    Emoji(
      '💾',
      '컴퓨터 | disk | floppy',
    ),
    Emoji(
      '💿',
      'blu-ray | CD | 컴퓨터 | disk | dvd | optical',
    ),
    Emoji(
      '📀',
      'Blu-ray | cd | 컴퓨터 | disk | DVD | optical',
    ),
    Emoji(
      '🧮',
      'abacus | calculation | calculator',
    ),
    Emoji(
      '🎥',
      'bollywood | 카메라 | cinema | film | hollywood | movie | record',
    ),
    Emoji(
      '🎞️',
      'cinema | film | frames | movie',
    ),
    Emoji(
      '📽️',
      'cinema | film | movie | projector | video',
    ),
    Emoji(
      '📺',
      'television | tv | video',
    ),
    Emoji(
      '📷',
      '카메라 | photo | 셀카 | 스냅 | tbt | trip | video',
    ),
    Emoji(
      '📸',
      '카메라 | flash | video',
    ),
    Emoji(
      '📹',
      'camcorder | 카메라 | tbt | video',
    ),
    Emoji(
      '📼',
      '늙은 | school | tape | vcr | vhs | video | videocassette',
    ),
    Emoji(
      '🔍',
      'glass | lab | 왼쪽 | left-pointing | magnifying | science | search | tilted | tool',
    ),
    Emoji(
      '🔎',
      'contact | glass | lab | magnifying | 오른쪽 | right-pointing | science | search | tilted | tool',
    ),
    Emoji(
      '🕯️',
      'candle | light',
    ),
    Emoji(
      '💡',
      'bulb | 만화 | electric | idea | light',
    ),
    Emoji(
      '🔦',
      'electric | flashlight | light | tool | torch',
    ),
    Emoji(
      '🏮',
      'bar | 등 | light | paper | 빨간 | restaurant',
    ),
    Emoji(
      '📔',
      'book | cover | decorated | decorative | education | notebook | school | 쓰기',
    ),
    Emoji(
      '📕',
      'book | 감은 | education',
    ),
    Emoji(
      '📖',
      'book | education | 판타지 | knowledge | library | novels | 열린 | reading',
    ),
    Emoji(
      '📗',
      'book | education | 판타지 | green | library | reading',
    ),
    Emoji(
      '📘',
      '파란 | book | education | 판타지 | library | reading',
    ),
    Emoji(
      '📙',
      'book | education | 판타지 | library | orange | reading',
    ),
    Emoji(
      '📚',
      'book | books | education | 판타지 | knowledge | library | novels | reading | school | study',
    ),
    Emoji(
      '📓',
      'notebook',
    ),
    Emoji(
      '📃',
      'curl | document | page | paper',
    ),
    Emoji(
      '📜',
      'paper | scroll',
    ),
    Emoji(
      '📄',
      'document | facing | page | paper | 위',
    ),
    Emoji(
      '📰',
      'communication | news | newspaper | paper',
    ),
    Emoji(
      '🗞️',
      'news | newspaper | paper | rolled | rolled-up',
    ),
    Emoji(
      '📑',
      'bookmark | 자국 | marker | tabs',
    ),
    Emoji(
      '🔖',
      'bookmark | 자국',
    ),
    Emoji(
      '🏷️',
      'label | tag',
    ),
    Emoji(
      '💰',
      'bag | bank | bet | billion | cash | 비용 | dollar | gold | million | 돈 | moneybag | 받은 | paying | pot | 부자 | 승리',
    ),
    Emoji(
      '💴',
      'bank | banknote | bill | currency | 돈 | note | yen',
    ),
    Emoji(
      '💵',
      'bank | banknote | bill | currency | dollar | 돈 | note',
    ),
    Emoji(
      '💶',
      '100 | bank | banknote | bill | currency | euro | 돈 | note | 부자',
    ),
    Emoji(
      '💷',
      'bank | banknote | bill | billion | cash | currency | 돈 | note | 주먹 | pounds',
    ),
    Emoji(
      '💸',
      'bank | banknote | bill | billion | cash | dollar | fly | million | 돈 | note | pay | wings',
    ),
    Emoji(
      '💳',
      'bank | card | cash | charge | credit | 돈 | pay',
    ),
    Emoji(
      '🪪',
      'card | credentials | document | ID | identification | license | security',
    ),
    Emoji(
      '🧾',
      'accounting | bookkeeping | evidence | invoice | proof | receipt',
    ),
    Emoji(
      '✉️',
      'e-mail | email | envelope | letter',
    ),
    Emoji(
      '📧',
      'e-mail | email | letter | mail',
    ),
    Emoji(
      '📨',
      'delivering | e-mail | email | envelope | incoming | letter | mail | receive | sent',
    ),
    Emoji(
      '📩',
      'arrow | communication | 아래 | e-mail | email | envelope | letter | mail | outgoing | send | sent',
    ),
    Emoji(
      '📤',
      'box | email | letter | mail | outbox | sent | tray',
    ),
    Emoji(
      '📥',
      'box | email | inbox | letter | mail | receive | tray | zero',
    ),
    Emoji(
      '📦',
      'box | communication | delivery | package | parcel | shipping',
    ),
    Emoji(
      '📫',
      '감은 | communication | flag | mail | mailbox | postbox | 든',
    ),
    Emoji(
      '📪',
      '감은 | flag | lowered | mail | mailbox | postbox',
    ),
    Emoji(
      '📬',
      'flag | mail | mailbox | 열린 | postbox | 든',
    ),
    Emoji(
      '📭',
      'flag | lowered | mail | mailbox | 열린 | postbox',
    ),
    Emoji(
      '📮',
      'mail | mailbox | postbox',
    ),
    Emoji(
      '🗳️',
      'ballot | box',
    ),
    Emoji(
      '✏️',
      'pencil',
    ),
    Emoji(
      '✒️',
      'black | nib | pen',
    ),
    Emoji(
      '🖋️',
      'fountain | pen',
    ),
    Emoji(
      '🖊️',
      'ballpoint | pen',
    ),
    Emoji(
      '🖌️',
      'paintbrush | painting',
    ),
    Emoji(
      '🖍️',
      'crayon',
    ),
    Emoji(
      '📝',
      'communication | media | memo | notes | pencil',
    ),
    Emoji(
      '📁',
      'file | folder',
    ),
    Emoji(
      '📂',
      'file | folder | 열린',
    ),
    Emoji(
      '🗂️',
      'card | dividers | 검지',
    ),
    Emoji(
      '📅',
      'calendar | 데이트',
    ),
    Emoji(
      '📆',
      'calendar | tear-off',
    ),
    Emoji(
      '🗒️',
      'note | notepad | pad | 소용돌이',
    ),
    Emoji(
      '🗓️',
      'calendar | pad | 소용돌이',
    ),
    Emoji(
      '📇',
      'card | 검지 | 늙은 | rolodex | school',
    ),
    Emoji(
      '📈',
      'chart | data | graph | growth | increasing | 오른쪽 | trend | 위 | upward',
    ),
    Emoji(
      '📉',
      'chart | data | decreasing | 아래 | downward | graph | negative | trend',
    ),
    Emoji(
      '📊',
      'bar | chart | data | graph',
    ),
    Emoji(
      '📋',
      'clipboard | do | list | notes',
    ),
    Emoji(
      '📌',
      'collage | pin | pushpin',
    ),
    Emoji(
      '📍',
      'location | map | pin | pushpin | round',
    ),
    Emoji(
      '📎',
      'paperclip',
    ),
    Emoji(
      '🖇️',
      'link | linked | paperclip | paperclips',
    ),
    Emoji(
      '📏',
      'angle | edge | math | ruler | 똑바른 | straightedge',
    ),
    Emoji(
      '📐',
      'angle | math | rule | ruler | set | 슬라이드 | triangle | triangular',
    ),
    Emoji(
      '✂️',
      'cut | cutting | paper | scissors | tool',
    ),
    Emoji(
      '🗃️',
      'box | card | file',
    ),
    Emoji(
      '🗄️',
      'cabinet | file | filing | paper',
    ),
    Emoji(
      '🗑️',
      'can | garbage | trash | waste | wastebasket',
    ),
    Emoji(
      '🔒',
      '감은 | lock | locked | private',
    ),
    Emoji(
      '🔓',
      'cracked | lock | 열린 | unlock | unlocked',
    ),
    Emoji(
      '🔏',
      'ink | lock | locked | nib | pen | privacy',
    ),
    Emoji(
      '🔐',
      'bike | 감은 | key | lock | locked | secure',
    ),
    Emoji(
      '🔑',
      'key | keys | lock | major | password | unlock',
    ),
    Emoji(
      '🗝️',
      'clue | key | lock | 늙은',
    ),
    Emoji(
      '🔨',
      'hammer | home | improvement | repairs | tool',
    ),
    Emoji(
      '⛏️',
      'hammer | mining | 고르다 | tool',
    ),
    Emoji(
      '⚒️',
      'hammer | 고르다 | tool',
    ),
    Emoji(
      '🛠️',
      'hammer | spanner | tool | wrench',
    ),
    Emoji(
      '🔪',
      '요리사 | cooking | hocho | kitchen | knife | tool | weapon',
    ),
    Emoji(
      '🗡️',
      'dagger | knife | weapon',
    ),
    Emoji(
      '⚔️',
      '교차 | swords | weapon',
    ),
    Emoji(
      '🔫',
      'gun | handgun | pistol | revolver | tool | water | weapon',
    ),
    Emoji(
      '🛡️',
      'shield | weapon',
    ),
    Emoji(
      '🔧',
      'home | improvement | spanner | tool | wrench',
    ),
    Emoji(
      '🔩',
      'bolt | home | improvement | nut | tool',
    ),
    Emoji(
      '⚙️',
      'cog | cogwheel | gear | tool',
    ),
    Emoji(
      '🗜️',
      'clamp | compress | tool | vice',
    ),
    Emoji(
      '⚖️',
      'balance | justice | Libra | scale | scales | tool | weight | zodiac',
    ),
    Emoji(
      '🔗',
      'link | links',
    ),
    Emoji(
      '⛓️',
      'chain | chains',
    ),
    Emoji(
      '🧰',
      'box | chest | 정비 | 빨간 | tool | toolbox',
    ),
    Emoji(
      '🧲',
      'attraction | horseshoe | magnet | magnetic | negative | positive | shape | u',
    ),
    Emoji(
      '⚗️',
      'alembic | chemistry | tool',
    ),
    Emoji(
      '🧪',
      '화학자 | chemistry | experiment | lab | science | test | tube',
    ),
    Emoji(
      '🧫',
      'bacteria | 생물학자 | biology | culture | dish | lab | petri',
    ),
    Emoji(
      '🧬',
      '생물학자 | dna | evolution | gene | genetics | life',
    ),
    Emoji(
      '🔬',
      'experiment | lab | microscope | science | tool',
    ),
    Emoji(
      '🩻',
      '뼈 | 의사 | 의료 | 뼈대 | 해골 | x-ray | xray',
    ),
    Emoji(
      '🔭',
      'contact | 외계 | science | telescope | tool',
    ),
    Emoji(
      '📡',
      'aliens | antenna | contact | dish | satellite | science',
    ),
    Emoji(
      '💉',
      '의사 | 독감 | 약 | needle | shot | 아픈 | syringe | tool | vaccination',
    ),
    Emoji(
      '💊',
      '의사 | drugs | medicated | 약 | pill | pills | 아픈 | vitamin',
    ),
    Emoji(
      '🚪',
      '다시 | closet | door | front',
    ),
    Emoji(
      '🛏️',
      '침대 | hotel | 잠',
    ),
    Emoji(
      '🛋️',
      'couch | hotel | lamp',
    ),
    Emoji(
      '🚽',
      'bathroom | toilet',
    ),
    Emoji(
      '🚿',
      'shower | water',
    ),
    Emoji(
      '🛁',
      'bath | bathtub',
    ),
    Emoji(
      '🧴',
      'bottle | lotion | moisturizer | shampoo | sunscreen',
    ),
    Emoji(
      '🧷',
      'diaper | pin | punk | 락 | safety',
    ),
    Emoji(
      '🧹',
      'broom | cleaning | sweeping | witch',
    ),
    Emoji(
      '🧺',
      'basket | farming | laundry | picnic',
    ),
    Emoji(
      '🧻',
      'paper | roll | toilet | towels',
    ),
    Emoji(
      '🧼',
      'bar | bathing | clean | cleaning | lather | soap | soapdish',
    ),
    Emoji(
      '🧽',
      'absorbing | cleaning | porous | soak | sponge',
    ),
    Emoji(
      '🧯',
      'extinguish | extinguisher | fire | quench',
    ),
    Emoji(
      '🚬',
      'cigarette | smoking',
    ),
    Emoji(
      '⚰️',
      'coffin | 죽은 | 죽음 | vampire',
    ),
    Emoji(
      '⚱️',
      'ashes | 죽음 | funeral | urn',
    ),
    Emoji(
      '🚰',
      'drinking | potable | water',
    ),
  ]),

// ======================================================= Category.SYMBOLS
  CategoryEmoji(Category.SYMBOLS, [
    Emoji(
      '💘',
      '143 | 귀여워 | arrow | cupid | 데이트 | 감정 | 하트 | 사랑해 | 사랑 | 로맨스 | valentine',
    ),
    Emoji(
      '💝',
      '143 | anniversary | 감정 | 하트 | 사랑해 | 키스 | ribbon | valentine | 뽀뽀',
    ),
    Emoji(
      '💖',
      '143 | 감정 | 신남 | 좋은 | 하트 | 사랑해 | 키스 | morning | 밤 | sparkle | sparkling | 뽀뽀',
    ),
    Emoji(
      '💗',
      '143 | 감정 | 신남 | growing | 하트 | heartpulse | 사랑해 | 키스 | 뽀뽀 | 긴장 | pulse | 뽀뽀',
    ),
    Emoji(
      '💓',
      '143 | beating | cardio | 감정 | 하트 | heartbeat | 사랑해 | 사랑 | pulsating | pulse',
    ),
    Emoji(
      '💞',
      '143 | 귀여워 | anniversary | 감정 | 하트 | 하트 | revolving',
    ),
    Emoji(
      '💕',
      '143 | anniversary | 데이트 | 데이트 | 감정 | 하트 | 하트 | 사랑해 | 키스 | 사랑 | loving | two | 뽀뽀',
    ),
    Emoji(
      '💟',
      '143 | decoration | 감정 | 하트 | hearth | 보라 | 하얀',
    ),
    Emoji(
      '❣️',
      'exclamation | 하트 | heavy | 자국 | punctuation',
    ),
    Emoji(
      '💔',
      'break | broken | crushed | 감정 | 하트 | heartbroken | lonely | 슬픈',
    ),
    Emoji(
      '❤️‍🔥',
      '감정 | 하트 | fire | fiery | 사랑 | 빨간',
    ),
    Emoji(
      '❤️',
      '감정 | 하트 | 사랑 | 빨간',
    ),
    Emoji(
      '🧡',
      '143 | 하트 | orange',
    ),
    Emoji(
      '💛',
      '143 | cardiac | 감정 | 하트 | 사랑해 | 사랑 | yellow',
    ),
    Emoji(
      '💚',
      '143 | 감정 | green | 하트 | 사랑해 | 사랑 | 로맨틱',
    ),
    Emoji(
      '💙',
      '143 | 파란 | 감정 | 하트 | 사랑해 | 사랑 | 로맨스',
    ),
    Emoji(
      '💜',
      '143 | bestest | 감정 | 하트 | 사랑해 | 사랑 | 보라',
    ),
    Emoji(
      '🖤',
      'black | 악 | 하트 | wicked',
    ),
    Emoji(
      '💯',
      '100 | a+ | 동의 | clearly | definitely | faithful | fleek | 배부른 | hundred | 유지 | perfect | 가리키다 | score | TRUE | truth | yup',
    ),
    Emoji(
      '💢',
      '화 | 화남 | 만화 | 화남 | symbol | 화남',
    ),
    Emoji(
      '💬',
      'balloon | bubble | 만화 | dialog | message | sms | speech | talk | text | typing',
    ),
    Emoji(
      '👁️‍🗨️',
      '1 | 몸 | 눈 | one balloon | bubble | dialog | 왼쪽 | speech',
    ),
    Emoji(
      '🗯️',
      '화 | 화남 | balloon | bubble | 화남 | 오른쪽',
    ),
    Emoji(
      '💭',
      'balloon | bubble | cartoon | cloud | 만화 | daydream | decisions | dream | idea | invent | invention | realize | think | thoughts | wonder',
    ),
    Emoji(
      '💤',
      '만화 | 좋은 | 잘자 | 밤 | 잠 | 자는 | 졸린 | 피곤 | zzz',
    ),
    Emoji(
      '💮',
      'flower | 하얀',
    ),
    Emoji(
      '♨️',
      '더운 | hotsprings | springs | steaming',
    ),
    Emoji(
      '💈',
      'barber | cut | fresh | haircut | pole | shave',
    ),
    Emoji(
      '🛑',
      'octagonal | 사인 | 멈춤',
    ),
    Emoji(
      '🕛',
      '12 | 12',
    ),
    Emoji(
      '🕧',
      '12 | 12',
    ),
    Emoji(
      '🕐',
      '1 | 1',
    ),
    Emoji(
      '🕜',
      '1 | 1',
    ),
    Emoji(
      '🕑',
      '2 | 2',
    ),
    Emoji(
      '🕝',
      '2 | 2',
    ),
    Emoji(
      '🕒',
      '3 | 3',
    ),
    Emoji(
      '🕞',
      '3 | 3',
    ),
    Emoji(
      '🕓',
      '4 | 4',
    ),
    Emoji(
      '🕟',
      '30 | 4 | 4',
    ),
    Emoji(
      '🕔',
      '5 | 5',
    ),
    Emoji(
      '🕠',
      '30 | 5 | 5',
    ),
    Emoji(
      '🕕',
      '6 | 6',
    ),
    Emoji(
      '🕡',
      '30 | 6 | 6',
    ),
    Emoji(
      '🕖',
      '0 | 7 | 7',
    ),
    Emoji(
      '🕢',
      '30 | 7 | 7',
    ),
    Emoji(
      '🕗',
      '8 | 8',
    ),
    Emoji(
      '🕣',
      '30 | 8 | 8',
    ),
    Emoji(
      '🕘',
      '9 | 9',
    ),
    Emoji(
      '🕤',
      '30 | 9 | 9',
    ),
    Emoji(
      '🕙',
      '0 | 10 | 10',
    ),
    Emoji(
      '🕥',
      '10 | 10',
    ),
    Emoji(
      '🕚',
      '11 | 11',
    ),
    Emoji(
      '🕦',
      '11 | 11',
    ),
    Emoji(
      '🌀',
      'cyclone | 어지러운 | hurricane | twister | typhoon | weather',
    ),
    Emoji(
      '♠️',
      'card | 게임 | spade | suit',
    ),
    Emoji(
      '♥️',
      'card | 감정 | 게임 | 하트 | 하트 | suit',
    ),
    Emoji(
      '♦️',
      'card | diamond | 게임 | suit',
    ),
    Emoji(
      '♣️',
      'card | club | clubs | 게임 | suit',
    ),
    Emoji(
      '🃏',
      'card | 게임 | joker | wildcard',
    ),
    Emoji(
      '🀄',
      'dragon | 게임 | mahjong | 빨간',
    ),
    Emoji(
      '🎴',
      'card | cards | flower | 게임 | Japanese | playing',
    ),
    Emoji(
      '🔇',
      '침묵 | muted | 조용 | 조용 | 소리 | speaker',
    ),
    Emoji(
      '🔈',
      'low | soft | 소리 | speaker | volume',
    ),
    Emoji(
      '🔉',
      'medium | 소리 | speaker | volume',
    ),
    Emoji(
      '🔊',
      '하이 | loud | music | 소리 | speaker | volume',
    ),
    Emoji(
      '📢',
      'address | communication | loud | loudspeaker | public | 소리',
    ),
    Emoji(
      '📣',
      'cheering | megaphone | 소리',
    ),
    Emoji(
      '📯',
      '뿔 | post | postal',
    ),
    Emoji(
      '🔔',
      'bell | break | church | 소리',
    ),
    Emoji(
      '🔕',
      'bell | 금지 | 침묵 | 아니 | 안 | prohibited | 조용 | 조용 | slash | 소리',
    ),
    Emoji(
      '🎵',
      'music | musical | note | 소리',
    ),
    Emoji(
      '🎶',
      'music | musical | note | notes | 소리',
    ),
    Emoji(
      '🏧',
      'ATM | automated | bank | cash | 돈 | 사인 | teller',
    ),
    Emoji(
      '🚮',
      'bin | litter | litterbin | 사인',
    ),
    Emoji(
      '🚰',
      'drinking | potable | water',
    ),
    Emoji(
      '♿',
      'access | handicap | symbol | wheelchair',
    ),
    Emoji(
      '🩼',
      'aid | cane | crutch | disability | help | 다친 | injured | mobility | stick',
    ),
    Emoji(
      '🚹',
      'bathroom | lavatory | 남자 | men’s | restroom | room | toilet | WC',
    ),
    Emoji(
      '🚺',
      'bathroom | lavatory | restroom | room | toilet | WC | 여자 | women’s',
    ),
    Emoji(
      '🚻',
      'bathroom | lavatory | restroom | toilet | WC',
    ),
    Emoji(
      '🚼',
      '아기 | changing | symbol',
    ),
    Emoji(
      '🚾',
      'bathroom | closet | lavatory | restroom | toilet | water | WC',
    ),
    Emoji(
      '⚠️',
      'caution | warning',
    ),
    Emoji(
      '🚸',
      '아이 | 아이 | crossing | pedestrian | traffic',
    ),
    Emoji(
      '⛔',
      'do | entry | 실패 | 금지 | 아니 | 안 | pass | prohibited | traffic',
    ),
    Emoji(
      '🚫',
      'entry | 금지 | 아니 | 안 | prohibited | smoke',
    ),
    Emoji(
      '🚳',
      'bicycle | bicycles | bike | 금지 | 아니 | 안 | prohibited',
    ),
    Emoji(
      '🚭',
      '금지 | 아니 | 안 | prohibited | smoke | smoking',
    ),
    Emoji(
      '🚯',
      '금지 | litter | littering | 아니 | 안 | prohibited',
    ),
    Emoji(
      '🚱',
      'dry | non-drinking | non-potable | prohibited | water',
    ),
    Emoji(
      '🚷',
      '금지 | 아니 | 안 | pedestrian | pedestrians | prohibited',
    ),
    Emoji(
      '🔞',
      '18 | age | eighteen | 금지 | 아니 | 안 | one | prohibited | restriction | underage',
    ),
    Emoji(
      '☢️',
      'radioactive | 사인',
    ),
    Emoji(
      '☣️',
      'biohazard | 사인',
    ),
    Emoji(
      '⬆️',
      'arrow | cardinal | direction | north | 위',
    ),
    Emoji(
      '↗️',
      'arrow | direction | intercardinal | northeast | up-right',
    ),
    Emoji(
      '➡️',
      'arrow | cardinal | direction | east | 오른쪽',
    ),
    Emoji(
      '↘️',
      'arrow | direction | down-right | intercardinal | southeast',
    ),
    Emoji(
      '⬇️',
      'arrow | cardinal | direction | 아래 | south',
    ),
    Emoji(
      '↙️',
      'arrow | direction | down-left | intercardinal | southwest',
    ),
    Emoji(
      '⬅️',
      'arrow | cardinal | direction | 왼쪽 | west',
    ),
    Emoji(
      '↖️',
      'arrow | direction | intercardinal | northwest | up-left',
    ),
    Emoji(
      '↕️',
      'arrow | up-down',
    ),
    Emoji(
      '↔️',
      'arrow | left-right',
    ),
    Emoji(
      '↩️',
      'arrow | curving | 왼쪽 | 오른쪽',
    ),
    Emoji(
      '↪️',
      'arrow | curving | 왼쪽 | 오른쪽',
    ),
    Emoji(
      '⤴️',
      'arrow | curving | 오른쪽 | 위',
    ),
    Emoji(
      '⤵️',
      'arrow | curving | 아래 | 오른쪽',
    ),
    Emoji(
      '🔃',
      'arrow | arrows | clockwise | refresh | reload | vertical',
    ),
    Emoji(
      '🔄',
      '또 | anticlockwise | arrow | arrows | button | counterclockwise | deja | refresh | rewindershins | vu',
    ),
    Emoji(
      '🔙',
      'arrow | 다시',
    ),
    Emoji(
      '🔚',
      'arrow | END',
    ),
    Emoji(
      '🔛',
      'arrow | 자국 | ON!',
    ),
    Emoji(
      '🔜',
      'arrow | brb | omw | SOON',
    ),
    Emoji(
      '🔝',
      'arrow | 친구 | TOP | 위',
    ),
    Emoji(
      '🛐',
      'place | 기도 | religion | worship',
    ),
    Emoji(
      '⚛️',
      'atheist | atom | symbol',
    ),
    Emoji(
      '🕉️',
      'Hindu | om | religion',
    ),
    Emoji(
      '✡️',
      'David | Jew | Jewish | judaism | religion | 별',
    ),
    Emoji(
      '☸️',
      'Buddhist | dharma | religion | wheel',
    ),
    Emoji(
      '☯️',
      'difficult | lives | religion | tao | taoist | total | yang | yin | yinyang',
    ),
    Emoji(
      '✝️',
      'christ | Christian | 교차 | latin | religion',
    ),
    Emoji(
      '☦️',
      'Christian | 교차 | orthodox | religion',
    ),
    Emoji(
      '☪️',
      'crescent | islam | Muslim | ramadan | religion | 별',
    ),
    Emoji(
      '☮️',
      'healing | 피스 | 평화 | symbol',
    ),
    Emoji(
      '🕎',
      'candelabrum | candlestick | hanukkah | jewish | judaism | menorah | religion',
    ),
    Emoji(
      '🔯',
      '점선 | fortune | jewish | judaism | six-pointed | 별',
    ),
    Emoji(
      '♈',
      'Aries | horoscope | ram | zodiac',
    ),
    Emoji(
      '♉',
      'bull | horoscope | ox | Taurus | zodiac',
    ),
    Emoji(
      '♊',
      'Gemini | horoscope | twins | zodiac',
    ),
    Emoji(
      '♋',
      'Cancer | crab | horoscope | zodiac',
    ),
    Emoji(
      '♌',
      'horoscope | Leo | lion | zodiac',
    ),
    Emoji(
      '♍',
      'horoscope | Virgo | zodiac',
    ),
    Emoji(
      '♎',
      'balance | horoscope | justice | Libra | scales | zodiac',
    ),
    Emoji(
      '♏',
      'horoscope | Scorpio | scorpion | Scorpius | zodiac',
    ),
    Emoji(
      '♐',
      'archer | horoscope | Sagittarius | zodiac',
    ),
    Emoji(
      '♑',
      'Capricorn | goat | horoscope | zodiac',
    ),
    Emoji(
      '♒',
      'Aquarius | bearer | horoscope | water | zodiac',
    ),
    Emoji(
      '♓',
      'fish | horoscope | Pisces | zodiac',
    ),
    Emoji(
      '⛎',
      'bearer | Ophiuchus | serpent | snake | zodiac',
    ),
    Emoji(
      '🔀',
      'arrow | button | 교차 | shuffle | tracks',
    ),
    Emoji(
      '🔁',
      'arrow | button | clockwise | repeat',
    ),
    Emoji(
      '🔂',
      'arrow | button | clockwise | once | repeat | single',
    ),
    Emoji(
      '▶️',
      'arrow | button | play | 오른쪽 | triangle',
    ),
    Emoji(
      '⏩',
      'arrow | button | double | fast | fast-forward | forward',
    ),
    Emoji(
      '◀️',
      'arrow | button | 왼쪽 | reverse | triangle',
    ),
    Emoji(
      '⏪',
      'arrow | button | double | fast | reverse | rewind',
    ),
    Emoji(
      '🔼',
      'arrow | button | 빨간 | 위 | upwards',
    ),
    Emoji(
      '⏫',
      'arrow | button | double | fast | 위',
    ),
    Emoji(
      '🔽',
      'arrow | button | 아래 | downwards | 빨간',
    ),
    Emoji(
      '⏬',
      'arrow | button | double | 아래 | fast',
    ),
    Emoji(
      '⏹️',
      'button | square | 멈춤',
    ),
    Emoji(
      '⏏️',
      'button | eject',
    ),
    Emoji(
      '🎦',
      '카메라 | cinema | film | movie',
    ),
    Emoji(
      '🔅',
      'brightness | button | dim | low',
    ),
    Emoji(
      '🔆',
      '밝은 | brightness | button | light',
    ),
    Emoji(
      '📶',
      'antenna | bar | bars | cell | communication | mobile | 폰 | signal | telephone',
    ),
    Emoji(
      '📳',
      'cell | communication | mobile | mode | 폰 | telephone | vibration',
    ),
    Emoji(
      '📴',
      'cell | mobile | off | 폰 | telephone',
    ),
    Emoji(
      '♾️',
      'forever | infinity | unbounded | universal',
    ),
    Emoji(
      '♻️',
      'recycle | recycling | symbol',
    ),
    Emoji(
      '🔱',
      'anchor | emblem | poseidon | ship | tool | trident',
    ),
    Emoji(
      '📛',
      'badge | name',
    ),
    Emoji(
      '🔰',
      'beginner | chevron | green | Japanese | leaf | symbol | tool | yellow',
    ),
    Emoji(
      '⭕',
      'circle | heavy | hollow | 큰 | o | 빨간',
    ),
    Emoji(
      '✅',
      '✓ | button | check | checked | checkmark | complete | completed | 끝 | fixed | 자국 | tick',
    ),
    Emoji(
      '☑️',
      '✓ | ballot | box | check | checked | 끝 | off | tick',
    ),
    Emoji(
      '✔️',
      '✓ | check | checked | checkmark | 끝 | heavy | 자국 | tick',
    ),
    Emoji(
      '❌',
      '× | cancel | 교차 | 자국 | multiplication | multiply | x',
    ),
    Emoji(
      '❎',
      '× | button | 교차 | 자국 | multiplication | multiply | square | x',
    ),
    Emoji(
      '➕',
      '+ | plus',
    ),
    Emoji(
      '➖',
      '- | − | heavy | math | minus | 사인',
    ),
    Emoji(
      '➗',
      '÷ | divide | division | heavy | math | 사인',
    ),
    Emoji(
      '✖️',
      '× | cancel | multiplication | multiply | 사인 | x',
    ),
    Emoji(
      '🟰',
      'answer | equal | equality | equals | heavy | math | 사인',
    ),
    Emoji(
      '➰',
      'curl | 곱슬 | loop',
    ),
    Emoji(
      '➿',
      'curl | 곱슬 | double | loop',
    ),
    Emoji(
      '〽️',
      'alternation | 자국 | part',
    ),
    Emoji(
      '✳️',
      '* | asterisk | eight-spoked',
    ),
    Emoji(
      '✴️',
      '* | eight-pointed | 별',
    ),
    Emoji(
      '❇️',
      '* | sparkle',
    ),
    Emoji(
      '‼️',
      '! | !! | bangbang | double | exclamation | 자국 | punctuation',
    ),
    Emoji(
      '⁉️',
      '! | !? | ? | exclamation | interrobang | 자국 | punctuation | 질문',
    ),
    Emoji(
      '❓',
      '? | 자국 | punctuation | 질문 | 빨간',
    ),
    Emoji(
      '❔',
      '? | 자국 | 윤곽 | punctuation | 질문 | 하얀',
    ),
    Emoji(
      '❕',
      '! | exclamation | 자국 | 윤곽 | punctuation | 하얀',
    ),
    Emoji(
      '❗',
      '! | exclamation | 자국 | punctuation | 빨간',
    ),
    Emoji(
      '©️',
      'C | copyright',
    ),
    Emoji(
      '®️',
      'R | registered',
    ),
    Emoji(
      '™️',
      '자국 | TM | trade | trademark',
    ),
    Emoji(
      '#️⃣',
      'Keycap Number Sign',
    ),
    Emoji(
      '0️⃣',
      'Keycap Digit Zero',
    ),
    Emoji(
      '1️⃣',
      'Keycap Digit One',
    ),
    Emoji(
      '2️⃣',
      'Keycap Digit Two',
    ),
    Emoji(
      '3️⃣',
      'Keycap Digit Three',
    ),
    Emoji(
      '4️⃣',
      'Keycap Digit Four',
    ),
    Emoji(
      '5️⃣',
      'Keycap Digit Five',
    ),
    Emoji(
      '6️⃣',
      'Keycap Digit Six',
    ),
    Emoji(
      '7️⃣',
      'Keycap Digit Seven',
    ),
    Emoji(
      '8️⃣',
      'Keycap Digit Eight',
    ),
    Emoji(
      '9️⃣',
      'Keycap Digit Nine',
    ),
    Emoji(
      '🔟',
      'Keycap: 10',
    ),
    Emoji(
      '🔠',
      'ABCD | input | latin | letters | uppercase',
    ),
    Emoji(
      '🔡',
      'abcd | input | latin | letters | lowercase',
    ),
    Emoji(
      '🔢',
      '1234 | input | numbers',
    ),
    Emoji(
      '🔣',
      '& | % | ♪ | 〒 | input | 기호',
    ),
    Emoji(
      '🔤',
      'abc | alphabet | input | latin | letters',
    ),
    Emoji(
      '🅰️',
      'blood | button | type',
    ),
    Emoji(
      '🆎',
      'AB | blood | button | type',
    ),
    Emoji(
      '🅱️',
      'B | blood | button | type',
    ),
    Emoji(
      '🆑',
      'button | CL',
    ),
    Emoji(
      '🆒',
      'button | 쿨',
    ),
    Emoji(
      '🆓',
      'button | FREE',
    ),
    Emoji(
      'ℹ️',
      'I | information',
    ),
    Emoji(
      '🆔',
      'button | ID | identity',
    ),
    Emoji(
      'Ⓜ️',
      'circle | circled | M',
    ),
    Emoji(
      '🆕',
      'button | NEW',
    ),
    Emoji(
      '🆖',
      'button | NG',
    ),
    Emoji(
      '🅾️',
      'blood | button | O | type',
    ),
    Emoji(
      '🆗',
      'button | 오케이 | okay',
    ),
    Emoji(
      '🅿️',
      'button | P | parking',
    ),
    Emoji(
      '🆘',
      'button | help | SOS',
    ),
    Emoji(
      '🆙',
      'button | 자국 | 위 | UP!',
    ),
    Emoji(
      '🆚',
      'button | versus | VS',
    ),
    Emoji(
      '🈁',
      'button | 여기 | Japanese | katakana',
    ),
    Emoji(
      '🈂️',
      'button | charge | Japanese | katakana | service',
    ),
    Emoji(
      '🈷️',
      '양 | button | ideograph | Japanese | monthly',
    ),
    Emoji(
      '🈶',
      'button | charge | free | ideograph | Japanese | 안',
    ),
    Emoji(
      '🈯',
      'button | ideograph | Japanese | reserved',
    ),
    Emoji(
      '🉐',
      'bargain | button | ideograph | Japanese',
    ),
    Emoji(
      '🈹',
      'button | discount | ideograph | Japanese',
    ),
    Emoji(
      '🈚',
      'button | charge | free | ideograph | Japanese',
    ),
    Emoji(
      '🈲',
      'button | ideograph | Japanese | prohibited',
    ),
    Emoji(
      '🉑',
      'acceptable | button | ideograph | Japanese',
    ),
    Emoji(
      '🈸',
      'application | button | ideograph | Japanese',
    ),
    Emoji(
      '🈴',
      'button | grade | ideograph | Japanese | passing',
    ),
    Emoji(
      '🈳',
      'button | ideograph | Japanese | vacancy',
    ),
    Emoji(
      '㊗️',
      'button | 축하 | ideograph | Japanese',
    ),
    Emoji(
      '㊙️',
      'button | ideograph | Japanese | 비밀',
    ),
    Emoji(
      '🈺',
      '비즈니스 | button | ideograph | Japanese | 열린',
    ),
    Emoji(
      '🈵',
      'button | ideograph | Japanese | 아니 | vacancy',
    ),
    Emoji(
      '🔴',
      'circle | geometric | 빨간',
    ),
    Emoji(
      '🔵',
      '파란 | circle | geometric',
    ),
    Emoji(
      '⚫',
      'black | circle | geometric',
    ),
    Emoji(
      '⚪',
      'circle | geometric | 하얀',
    ),
    Emoji(
      '⬛',
      'black | geometric | 큰 | square',
    ),
    Emoji(
      '⬜',
      'geometric | 큰 | square | 하얀',
    ),
    Emoji(
      '◼️',
      'black | geometric | medium | square',
    ),
    Emoji(
      '◻️',
      'geometric | medium | square | 하얀',
    ),
    Emoji(
      '◾',
      'black | geometric | medium-small | square',
    ),
    Emoji(
      '◽',
      'geometric | medium-small | square | 하얀',
    ),
    Emoji(
      '▪️',
      'black | geometric | 작은 | square',
    ),
    Emoji(
      '▫️',
      'geometric | 작은 | square | 하얀',
    ),
    Emoji(
      '🔶',
      'diamond | geometric | 큰 | orange',
    ),
    Emoji(
      '🔷',
      '파란 | diamond | geometric | 큰',
    ),
    Emoji(
      '🔸',
      'diamond | geometric | orange | 작은',
    ),
    Emoji(
      '🔹',
      '파란 | diamond | geometric | 작은',
    ),
    Emoji(
      '🔺',
      'geometric | pointed | 빨간 | triangle | 위',
    ),
    Emoji(
      '🔻',
      '아래 | geometric | pointed | 빨간 | triangle',
    ),
    Emoji(
      '💠',
      '만화 | diamond | dot | geometric',
    ),
    Emoji(
      '🔳',
      'button | geometric | 윤곽 | square | 하얀',
    ),
    Emoji(
      '🔲',
      'black | button | geometric | square',
    ),
  ]),

// ======================================================= Category.FLAGS
  CategoryEmoji(Category.FLAGS, [
    Emoji(
      '🏁',
      'checkered | chequered | finish | flag | flags | 게임 | race | racing | sport | 승리',
    ),
    Emoji(
      '🚩',
      'construction | flag | golf | post | triangular',
    ),
    Emoji(
      '🎌',
      '축하 | 교차 | 교차 | flags | Japanese',
    ),
    Emoji(
      '🏴',
      'black | flag | waving',
    ),
    Emoji(
      '🏳️',
      'flag | waving | 하얀',
    ),
    Emoji(
      '🏳️‍🌈',
      'flag | waving | white gay | genderqueer | glbt | glbtq | lesbian | lgbt | lgbtq | lgbtqia | nature | pride | queer | rain | rainbow | trans | transgender | weather',
    ),
    Emoji(
      '🏳️‍⚧️',
      'flag | waving | white symbol | transgender',
    ),
    Emoji(
      '🏴‍☠️',
      'black | flag | waving bone | X | 죽은 | 죽음 | 얼굴 | 괴물 | 해골',
    ),
    Emoji(
      '🇦🇨',
      'Flag: Ascension Island',
    ),
    Emoji(
      '🇦🇩',
      'Flag: Andorra',
    ),
    Emoji(
      '🇦🇪',
      'Flag: United Arab Emirates',
    ),
    Emoji(
      '🇦🇫',
      'Flag: Afghanistan',
    ),
    Emoji(
      '🇦🇬',
      'Flag: Antigua & Barbuda',
    ),
    Emoji(
      '🇦🇮',
      'Flag: Anguilla',
    ),
    Emoji(
      '🇦🇱',
      'Flag: Albania',
    ),
    Emoji(
      '🇦🇲',
      'Flag: Armenia',
    ),
    Emoji(
      '🇦🇴',
      'Flag: Angola',
    ),
    Emoji(
      '🇦🇶',
      'Flag: Antarctica',
    ),
    Emoji(
      '🇦🇷',
      'Flag: Argentina',
    ),
    Emoji(
      '🇦🇸',
      'Flag: American Samoa',
    ),
    Emoji(
      '🇦🇹',
      'Flag: Austria',
    ),
    Emoji(
      '🇦🇺',
      'Flag: Australia',
    ),
    Emoji(
      '🇦🇼',
      'Flag: Aruba',
    ),
    Emoji(
      '🇦🇽',
      'Flag: Åland Islands',
    ),
    Emoji(
      '🇦🇿',
      'Flag: Azerbaijan',
    ),
    Emoji(
      '🇧🇦',
      'Flag: Bosnia & Herzegovina',
    ),
    Emoji(
      '🇧🇧',
      'Flag: Barbados',
    ),
    Emoji(
      '🇧🇩',
      'Flag: Bangladesh',
    ),
    Emoji(
      '🇧🇪',
      'Flag: Belgium',
    ),
    Emoji(
      '🇧🇫',
      'Flag: Burkina Faso',
    ),
    Emoji(
      '🇧🇬',
      'Flag: Bulgaria',
    ),
    Emoji(
      '🇧🇭',
      'Flag: Bahrain',
    ),
    Emoji(
      '🇧🇮',
      'Flag: Burundi',
    ),
    Emoji(
      '🇧🇯',
      'Flag: Benin',
    ),
    Emoji(
      '🇧🇱',
      'Flag: St. Barthélemy',
    ),
    Emoji(
      '🇧🇲',
      'Flag: Bermuda',
    ),
    Emoji(
      '🇧🇳',
      'Flag: Brunei',
    ),
    Emoji(
      '🇧🇴',
      'Flag: Bolivia',
    ),
    Emoji(
      '🇧🇶',
      'Flag: Caribbean Netherlands',
    ),
    Emoji(
      '🇧🇷',
      'Flag: Brazil',
    ),
    Emoji(
      '🇧🇸',
      'Flag: Bahamas',
    ),
    Emoji(
      '🇧🇹',
      'Flag: Bhutan',
    ),
    Emoji(
      '🇧🇻',
      'Flag: Bouvet Island',
    ),
    Emoji(
      '🇧🇼',
      'Flag: Botswana',
    ),
    Emoji(
      '🇧🇾',
      'Flag: Belarus',
    ),
    Emoji(
      '🇧🇿',
      'Flag: Belize',
    ),
    Emoji(
      '🇨🇦',
      'Flag: Canada',
    ),
    Emoji(
      '🇨🇨',
      'Flag: Cocos (Keeling) Islands',
    ),
    Emoji(
      '🇨🇩',
      'Flag: Congo - Kinshasa',
    ),
    Emoji(
      '🇨🇫',
      'Flag: Central African Republic',
    ),
    Emoji(
      '🇨🇬',
      'Flag: Congo - Brazzaville',
    ),
    Emoji(
      '🇨🇭',
      'Flag: Switzerland',
    ),
    Emoji(
      '🇨🇮',
      'Flag: Côte d’Ivoire',
    ),
    Emoji(
      '🇨🇰',
      'Flag: Cook Islands',
    ),
    Emoji(
      '🇨🇱',
      'Flag: Chile',
    ),
    Emoji(
      '🇨🇲',
      'Flag: Cameroon',
    ),
    Emoji(
      '🇨🇳',
      'Flag: China',
    ),
    Emoji(
      '🇨🇴',
      'Flag: Colombia',
    ),
    Emoji(
      '🇨🇵',
      'Flag: Clipperton Island',
    ),
    Emoji(
      '🇨🇷',
      'Flag: Costa Rica',
    ),
    Emoji(
      '🇨🇺',
      'Flag: Cuba',
    ),
    Emoji(
      '🇨🇻',
      'Flag: Cape Verde',
    ),
    Emoji(
      '🇨🇼',
      'Flag: Curaçao',
    ),
    Emoji(
      '🇨🇽',
      'Flag: Christmas Island',
    ),
    Emoji(
      '🇨🇾',
      'Flag: Cyprus',
    ),
    Emoji(
      '🇨🇿',
      'Flag: Czechia',
    ),
    Emoji(
      '🇩🇪',
      'Flag: Germany',
    ),
    Emoji(
      '🇩🇬',
      'Flag: Diego Garcia',
    ),
    Emoji(
      '🇩🇯',
      'Flag: Djibouti',
    ),
    Emoji(
      '🇩🇰',
      'Flag: Denmark',
    ),
    Emoji(
      '🇩🇲',
      'Flag: Dominica',
    ),
    Emoji(
      '🇩🇴',
      'Flag: Dominican Republic',
    ),
    Emoji(
      '🇩🇿',
      'Flag: Algeria',
    ),
    Emoji(
      '🇪🇦',
      'Flag: Ceuta & Melilla',
    ),
    Emoji(
      '🇪🇨',
      'Flag: Ecuador',
    ),
    Emoji(
      '🇪🇪',
      'Flag: Estonia',
    ),
    Emoji(
      '🇪🇬',
      'Flag: Egypt',
    ),
    Emoji(
      '🇪🇭',
      'Flag: Western Sahara',
    ),
    Emoji(
      '🇪🇷',
      'Flag: Eritrea',
    ),
    Emoji(
      '🇪🇸',
      'Flag: Spain',
    ),
    Emoji(
      '🇪🇹',
      'Flag: Ethiopia',
    ),
    Emoji(
      '🇪🇺',
      'Flag: European Union',
    ),
    Emoji(
      '🇫🇮',
      'Flag: Finland',
    ),
    Emoji(
      '🇫🇯',
      'Flag: Fiji',
    ),
    Emoji(
      '🇫🇰',
      'Flag: Falkland Islands',
    ),
    Emoji(
      '🇫🇲',
      'Flag: Micronesia',
    ),
    Emoji(
      '🇫🇴',
      'Flag: Faroe Islands',
    ),
    Emoji(
      '🇫🇷',
      'Flag: France',
    ),
    Emoji(
      '🇬🇦',
      'Flag: Gabon',
    ),
    Emoji(
      '🇬🇧',
      'Flag: United Kingdom',
    ),
    Emoji(
      '🇬🇩',
      'Flag: Grenada',
    ),
    Emoji(
      '🇬🇪',
      'Flag: Georgia',
    ),
    Emoji(
      '🇬🇫',
      'Flag: French Guiana',
    ),
    Emoji(
      '🇬🇬',
      'Flag: Guernsey',
    ),
    Emoji(
      '🇬🇭',
      'Flag: Ghana',
    ),
    Emoji(
      '🇬🇮',
      'Flag: Gibraltar',
    ),
    Emoji(
      '🇬🇱',
      'Flag: Greenland',
    ),
    Emoji(
      '🇬🇲',
      'Flag: Gambia',
    ),
    Emoji(
      '🇬🇳',
      'Flag: Guinea',
    ),
    Emoji(
      '🇬🇵',
      'Flag: Guadeloupe',
    ),
    Emoji(
      '🇬🇶',
      'Flag: Equatorial Guinea',
    ),
    Emoji(
      '🇬🇷',
      'Flag: Greece',
    ),
    Emoji(
      '🇬🇸',
      'Flag: South Georgia & South Sandwich Islands',
    ),
    Emoji(
      '🇬🇹',
      'Flag: Guatemala',
    ),
    Emoji(
      '🇬🇺',
      'Flag: Guam',
    ),
    Emoji(
      '🇬🇼',
      'Flag: Guinea-Bissau',
    ),
    Emoji(
      '🇬🇾',
      'Flag: Guyana',
    ),
    Emoji(
      '🇭🇰',
      'Flag: Hong Kong SAR China',
    ),
    Emoji(
      '🇭🇲',
      'Flag: Heard & McDonald Islands',
    ),
    Emoji(
      '🇭🇳',
      'Flag: Honduras',
    ),
    Emoji(
      '🇭🇷',
      'Flag: Croatia',
    ),
    Emoji(
      '🇭🇹',
      'Flag: Haiti',
    ),
    Emoji(
      '🇭🇺',
      'Flag: Hungary',
    ),
    Emoji(
      '🇮🇨',
      'Flag: Canary Islands',
    ),
    Emoji(
      '🇮🇩',
      'Flag: Indonesia',
    ),
    Emoji(
      '🇮🇪',
      'Flag: Ireland',
    ),
    Emoji(
      '🇮🇱',
      'Flag: Israel',
    ),
    Emoji(
      '🇮🇲',
      'Flag: Isle of Man',
    ),
    Emoji(
      '🇮🇳',
      'Flag: India',
    ),
    Emoji(
      '🇮🇴',
      'Flag: British Indian Ocean Territory',
    ),
    Emoji(
      '🇮🇶',
      'Flag: Iraq',
    ),
    Emoji(
      '🇮🇷',
      'Flag: Iran',
    ),
    Emoji(
      '🇮🇸',
      'Flag: Iceland',
    ),
    Emoji(
      '🇮🇹',
      'Flag: Italy',
    ),
    Emoji(
      '🇯🇪',
      'Flag: Jersey',
    ),
    Emoji(
      '🇯🇲',
      'Flag: Jamaica',
    ),
    Emoji(
      '🇯🇴',
      'Flag: Jordan',
    ),
    Emoji(
      '🇯🇵',
      'Flag: Japan',
    ),
    Emoji(
      '🇰🇪',
      'Flag: Kenya',
    ),
    Emoji(
      '🇰🇬',
      'Flag: Kyrgyzstan',
    ),
    Emoji(
      '🇰🇭',
      'Flag: Cambodia',
    ),
    Emoji(
      '🇰🇮',
      'Flag: Kiribati',
    ),
    Emoji(
      '🇰🇲',
      'Flag: Comoros',
    ),
    Emoji(
      '🇰🇳',
      'Flag: St. Kitts & Nevis',
    ),
    Emoji(
      '🇰🇵',
      'Flag: North Korea',
    ),
    Emoji(
      '🇰🇷',
      'Flag: South Korea',
    ),
    Emoji(
      '🇰🇼',
      'Flag: Kuwait',
    ),
    Emoji(
      '🇰🇾',
      'Flag: Cayman Islands',
    ),
    Emoji(
      '🇰🇿',
      'Flag: Kazakhstan',
    ),
    Emoji(
      '🇱🇦',
      'Flag: Laos',
    ),
    Emoji(
      '🇱🇧',
      'Flag: Lebanon',
    ),
    Emoji(
      '🇱🇨',
      'Flag: St. Lucia',
    ),
    Emoji(
      '🇱🇮',
      'Flag: Liechtenstein',
    ),
    Emoji(
      '🇱🇰',
      'Flag: Sri Lanka',
    ),
    Emoji(
      '🇱🇷',
      'Flag: Liberia',
    ),
    Emoji(
      '🇱🇸',
      'Flag: Lesotho',
    ),
    Emoji(
      '🇱🇹',
      'Flag: Lithuania',
    ),
    Emoji(
      '🇱🇺',
      'Flag: Luxembourg',
    ),
    Emoji(
      '🇱🇻',
      'Flag: Latvia',
    ),
    Emoji(
      '🇱🇾',
      'Flag: Libya',
    ),
    Emoji(
      '🇲🇦',
      'Flag: Morocco',
    ),
    Emoji(
      '🇲🇨',
      'Flag: Monaco',
    ),
    Emoji(
      '🇲🇩',
      'Flag: Moldova',
    ),
    Emoji(
      '🇲🇪',
      'Flag: Montenegro',
    ),
    Emoji(
      '🇲🇫',
      'Flag: St. Martin',
    ),
    Emoji(
      '🇲🇬',
      'Flag: Madagascar',
    ),
    Emoji(
      '🇲🇭',
      'Flag: Marshall Islands',
    ),
    Emoji(
      '🇲🇰',
      'Flag: North Macedonia',
    ),
    Emoji(
      '🇲🇱',
      'Flag: Mali',
    ),
    Emoji(
      '🇲🇲',
      'Flag: Myanmar (Burma)',
    ),
    Emoji(
      '🇲🇳',
      'Flag: Mongolia',
    ),
    Emoji(
      '🇲🇴',
      'Flag: Macau Sar China',
    ),
    Emoji(
      '🇲🇵',
      'Flag: Northern Mariana Islands',
    ),
    Emoji(
      '🇲🇶',
      'Flag: Martinique',
    ),
    Emoji(
      '🇲🇷',
      'Flag: Mauritania',
    ),
    Emoji(
      '🇲🇸',
      'Flag: Montserrat',
    ),
    Emoji(
      '🇲🇹',
      'Flag: Malta',
    ),
    Emoji(
      '🇲🇺',
      'Flag: Mauritius',
    ),
    Emoji(
      '🇲🇻',
      'Flag: Maldives',
    ),
    Emoji(
      '🇲🇼',
      'Flag: Malawi',
    ),
    Emoji(
      '🇲🇽',
      'Flag: Mexico',
    ),
    Emoji(
      '🇲🇾',
      'Flag: Malaysia',
    ),
    Emoji(
      '🇲🇿',
      'Flag: Mozambique',
    ),
    Emoji(
      '🇳🇦',
      'Flag: Namibia',
    ),
    Emoji(
      '🇳🇨',
      'Flag: New Caledonia',
    ),
    Emoji(
      '🇳🇪',
      'Flag: Niger',
    ),
    Emoji(
      '🇳🇫',
      'Flag: Norfolk Island',
    ),
    Emoji(
      '🇳🇬',
      'Flag: Nigeria',
    ),
    Emoji(
      '🇳🇮',
      'Flag: Nicaragua',
    ),
    Emoji(
      '🇳🇱',
      'Flag: Netherlands',
    ),
    Emoji(
      '🇳🇴',
      'Flag: Norway',
    ),
    Emoji(
      '🇳🇵',
      'Flag: Nepal',
    ),
    Emoji(
      '🇳🇷',
      'Flag: Nauru',
    ),
    Emoji(
      '🇳🇺',
      'Flag: Niue',
    ),
    Emoji(
      '🇳🇿',
      'Flag: New Zealand',
    ),
    Emoji(
      '🇴🇲',
      'Flag: Oman',
    ),
    Emoji(
      '🇵🇦',
      'Flag: Panama',
    ),
    Emoji(
      '🇵🇪',
      'Flag: Peru',
    ),
    Emoji(
      '🇵🇫',
      'Flag: French Polynesia',
    ),
    Emoji(
      '🇵🇬',
      'Flag: Papua New Guinea',
    ),
    Emoji(
      '🇵🇭',
      'Flag: Philippines',
    ),
    Emoji(
      '🇵🇰',
      'Flag: Pakistan',
    ),
    Emoji(
      '🇵🇱',
      'Flag: Poland',
    ),
    Emoji(
      '🇵🇲',
      'Flag: St. Pierre & Miquelon',
    ),
    Emoji(
      '🇵🇳',
      'Flag: Pitcairn Islands',
    ),
    Emoji(
      '🇵🇷',
      'Flag: Puerto Rico',
    ),
    Emoji(
      '🇵🇸',
      'Flag: Palestinian Territories',
    ),
    Emoji(
      '🇵🇹',
      'Flag: Portugal',
    ),
    Emoji(
      '🇵🇼',
      'Flag: Palau',
    ),
    Emoji(
      '🇵🇾',
      'Flag: Paraguay',
    ),
    Emoji(
      '🇶🇦',
      'Flag: Qatar',
    ),
    Emoji(
      '🇷🇪',
      'Flag: Réunion',
    ),
    Emoji(
      '🇷🇴',
      'Flag: Romania',
    ),
    Emoji(
      '🇷🇸',
      'Flag: Serbia',
    ),
    Emoji(
      '🇷🇺',
      'Flag: Russia',
    ),
    Emoji(
      '🇷🇼',
      'Flag: Rwanda',
    ),
    Emoji(
      '🇸🇦',
      'Flag: Saudi Arabia',
    ),
    Emoji(
      '🇸🇧',
      'Flag: Solomon Islands',
    ),
    Emoji(
      '🇸🇨',
      'Flag: Seychelles',
    ),
    Emoji(
      '🇸🇩',
      'Flag: Sudan',
    ),
    Emoji(
      '🇸🇪',
      'Flag: Sweden',
    ),
    Emoji(
      '🇸🇬',
      'Flag: Singapore',
    ),
    Emoji(
      '🇸🇭',
      'Flag: St. Helena',
    ),
    Emoji(
      '🇸🇮',
      'Flag: Slovenia',
    ),
    Emoji(
      '🇸🇯',
      'Flag: Svalbard & Jan Mayen',
    ),
    Emoji(
      '🇸🇰',
      'Flag: Slovakia',
    ),
    Emoji(
      '🇸🇱',
      'Flag: Sierra Leone',
    ),
    Emoji(
      '🇸🇲',
      'Flag: San Marino',
    ),
    Emoji(
      '🇸🇳',
      'Flag: Senegal',
    ),
    Emoji(
      '🇸🇴',
      'Flag: Somalia',
    ),
    Emoji(
      '🇸🇷',
      'Flag: Suriname',
    ),
    Emoji(
      '🇸🇸',
      'Flag: South Sudan',
    ),
    Emoji(
      '🇸🇹',
      'Flag: São Tomé & Príncipe',
    ),
    Emoji(
      '🇸🇻',
      'Flag: El Salvador',
    ),
    Emoji(
      '🇸🇽',
      'Flag: Sint Maarten',
    ),
    Emoji(
      '🇸🇾',
      'Flag: Syria',
    ),
    Emoji(
      '🇸🇿',
      'Flag: Swaziland',
    ),
    Emoji(
      '🇹🇦',
      'Flag: Tristan Da Cunha',
    ),
    Emoji(
      '🇹🇨',
      'Flag: Turks & Caicos Islands',
    ),
    Emoji(
      '🇹🇩',
      'Flag: Chad',
    ),
    Emoji(
      '🇹🇫',
      'Flag: French Southern Territories',
    ),
    Emoji(
      '🇹🇬',
      'Flag: Togo',
    ),
    Emoji(
      '🇹🇭',
      'Flag: Thailand',
    ),
    Emoji(
      '🇹🇯',
      'Flag: Tajikistan',
    ),
    Emoji(
      '🇹🇰',
      'Flag: Tokelau',
    ),
    Emoji(
      '🇹🇱',
      'Flag: Timor-Leste',
    ),
    Emoji(
      '🇹🇲',
      'Flag: Turkmenistan',
    ),
    Emoji(
      '🇹🇳',
      'Flag: Tunisia',
    ),
    Emoji(
      '🇹🇴',
      'Flag: Tonga',
    ),
    Emoji(
      '🇹🇷',
      'Flag: Turkey',
    ),
    Emoji(
      '🇹🇹',
      'Flag: Trinidad & Tobago',
    ),
    Emoji(
      '🇹🇻',
      'Flag: Tuvalu',
    ),
    Emoji(
      '🇹🇼',
      'Flag: Taiwan',
    ),
    Emoji(
      '🇹🇿',
      'Flag: Tanzania',
    ),
    Emoji(
      '🇺🇦',
      'Flag: Ukraine',
    ),
    Emoji(
      '🇺🇬',
      'Flag: Uganda',
    ),
    Emoji(
      '🇺🇲',
      'Flag: U.S. Outlying Islands',
    ),
    Emoji(
      '🇺🇳',
      'Flag: United Nations',
    ),
    Emoji(
      '🇺🇸',
      'Flag: United States',
    ),
    Emoji(
      '🇺🇾',
      'Flag: Uruguay',
    ),
    Emoji(
      '🇺🇿',
      'Flag: Uzbekistan',
    ),
    Emoji(
      '🇻🇦',
      'Flag: Vatican City',
    ),
    Emoji(
      '🇻🇨',
      'Flag: St. Vincent & Grenadines',
    ),
    Emoji(
      '🇻🇪',
      'Flag: Venezuela',
    ),
    Emoji(
      '🇻🇬',
      'Flag: British Virgin Islands',
    ),
    Emoji(
      '🇻🇮',
      'Flag: U.S. Virgin Islands',
    ),
    Emoji(
      '🇻🇳',
      'Flag: Vietnam',
    ),
    Emoji(
      '🇻🇺',
      'Flag: Vanuatu',
    ),
    Emoji(
      '🇼🇫',
      'Flag: Wallis & Futuna',
    ),
    Emoji(
      '🇼🇸',
      'Flag: Samoa',
    ),
    Emoji(
      '🇽🇰',
      'Flag: Kosovo',
    ),
    Emoji(
      '🇾🇪',
      'Flag: Yemen',
    ),
    Emoji(
      '🇾🇹',
      'Flag: Mayotte',
    ),
    Emoji(
      '🇿🇦',
      'Flag: South Africa',
    ),
    Emoji(
      '🇿🇲',
      'Flag: Zambia',
    ),
    Emoji(
      '🇿🇼',
      'Flag: Zimbabwe',
    ),
  ]),
];
