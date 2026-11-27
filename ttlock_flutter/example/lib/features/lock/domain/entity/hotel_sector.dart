/// 扇区「BLE 已生效、云端未同步」的业务码。
///
/// [LockDomain.applyHotelCardSector] 在 BLE 成功、云端失败时抛出该码，
/// 并把本次提交的 sector 放进 [AppException.data]，供页面重试同步。
///
/// 页面据此与「BLE 失败」区分：前者锁的扇区**已改**，文案不可写成「设置失败」。
/// 该码在 `core/locale/app_message_mapper.dart` 有登记。
const int kHotelSectorCloudPendingCode = -35;

/// 酒店信息（hotelInfo / icKey）不可用。
///
/// cardEncoder 两接口是收费功能且要求已建酒店，失败时统一用该码。
const int kCardEncoderUnavailableCode = -29;
