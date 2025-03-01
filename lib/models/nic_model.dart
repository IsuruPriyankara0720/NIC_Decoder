// Model class to represent NIC details
class NICModel {
  // NIC number
  String? nic;
  
  // Year of birth extracted from NIC
  String? birthYear;
  
  // Date of birth extracted from NIC
  String? dateOfBirth;
  
  // Gender extracted from NIC
  String? gender;
  
  // Age calculated from date of birth
  String? age;
  
  // Weekday of birth
  String? weekday;
  
  // Voting eligibility status
  String? votingEligibility;

  // Constructor for NICModel
  NICModel({
    this.nic,
    this.birthYear,
    this.dateOfBirth,
    this.gender,
    this.age,
    this.weekday,
    this.votingEligibility,
  });
}