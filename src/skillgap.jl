"""
    skillgap(onetCodeSource::AbstractString,
             onetCodeTarget::AbstractString,
             location::AbstractString = "US",
             userId::AbstractString = ENV["API_CAREERONESTOP_USER"],
             token::AbstractString = ENV["API_CAREERONESTOP"],
             radius::Integer = 25,
             )

Consumes the `Skills Gaps` endpoint of the CareerOneStop API.

# Example

```jldoctest
julia> rn_cns = skillgap("29114100", "29114104") # By default the location is 'US' which uses national data
JSON3.Object{Array{UInt8,1},Array{UInt64,1}} with 19 entries:
  :OccupationSkillsGapList   => JSON3.Object[{…
  :OccupationSkillsMatchList => JSON3.Object[{…
  :CurrentOccupationTitle    => "Registered Nurses"
  :TargetOccupationTitle     => "Clinical Nurse Specialists"
  :CurrentOccupationCode     => "29114100"
  :TargetOccupationCode      => "29114104"
  :CurrentOccupationWage     => "\$73,300"
  :TargetOccupationWage      => "\$73,300"
  :CurrentEducationTitle     => "Bachelor's degree"
  :TargetEducationTitle      => "Bachelor's degree"
  :CurrentExperienceTitle    => "None"
  :TargetExperienceTitle     => "None"
  :CurrentTrainingTitle      => "None"
  :TargetTrainingTitle       => "None"
  :CurrentLicenses           => 91
  :TargetLicenses            => 53
  :CurrentCertificates       => 169
  :TargetCertificates        => 45
  :LocationState             => "US"

julia> @views rn_cns.OccupationSkillsGapList[1:2]
2-element view(::JSON3.Array{JSON3.Object, Vector{UInt8}, SubArray{UInt64, 1, Vector{UInt64}, Tuple{UnitRange{Int64}}, true}}, 1:2) with eltype JSON3.Object:
 {
               "Title": "Education and Training",
         "Description": "Knowledge of principles and methods for curriculum and training design, teaching and instruction for individuals and groups, and the measurement of training effects.",
             "SkillId": "2.C.6",
      "SKScoreCurrent": "Medium",
       "SKScoreTarget": "Very High",
           "SkillType": "knowledge",
   "AvailableTraining": true
}
 {
               "Title": "Operations Analysis",
         "Description": "Figuring out what a product or service needs to be able to do.",
             "SkillId": "2.B.3.a",
      "SKScoreCurrent": "Very Low",
       "SKScoreTarget": "Medium",
           "SkillType": "skills",
   "AvailableTraining": false
}

```

```jldoctest
julia> skillgap("29114101", "29114100", "VA")
JSON3.Object{Array{UInt8,1},Array{UInt64,1}} with 19 entries:
  :OccupationSkillsGapList   => nothing
  :OccupationSkillsMatchList => JSON3.Object[{…
  :CurrentOccupationTitle    => "Acute Care Nurses"
  :TargetOccupationTitle     => "Registered Nurses"
  :CurrentOccupationCode     => "29114101"
  :TargetOccupationCode      => "29114100"
  :CurrentOccupationWage     => "\$70,200"
  :TargetOccupationWage      => "\$70,200"
  :CurrentEducationTitle     => "Bachelor's degree"
  :TargetEducationTitle      => "Bachelor's degree"
  :CurrentExperienceTitle    => "None"
  :TargetExperienceTitle     => "None"
  :CurrentTrainingTitle      => "None"
  :TargetTrainingTitle       => "None"
  :CurrentLicenses           => 0
  :TargetLicenses            => 2
  :CurrentCertificates       => 40
  :TargetCertificates        => 169
  :LocationState             => "VA"
```
"""
function skillgap(onetCodeSource::AbstractString,
                  onetCodeTarget::AbstractString,
                  location::AbstractString = "US",
                  userId::AbstractString = ENV["API_CAREERONESTOP_USER"],
                  token::AbstractString = ENV["API_CAREERONESTOP"],
                  radius::Integer = 25,
                  )
    response = request("GET",
                       URI(scheme = "https",
                           host = "api.careeronestop.org",
                           path = "/v1/skillgap/$userId/$onetCodeSource/$onetCodeTarget/$location/$radius"),
                       ["Authorization" => "Bearer $token"],
                       )
    @assert response.status == 200
    json = JSON3.read(response.body)
end
