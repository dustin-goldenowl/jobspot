enum VerifyStatus { none, pending, accept, decline }

VerifyStatus? getVerifyStatus(String? status) {
  switch (status) {
    case "pending":
      return VerifyStatus.pending;
    case "accept":
      return VerifyStatus.accept;
    case "decline":
      return VerifyStatus.decline;
    case "none":
      return VerifyStatus.none;
    default:
      return null;
  }
}
