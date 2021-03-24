"""
    certificationfinder(keyword::AbstractString,
                        userId::AbstractString = ENV["API_CAREERONESTOP_USER"],
                        token::AbstractString = ENV["API_CAREERONESTOP"],
                        directFlag::AbstractString = "0",
                        industry::AbstractString = "0",
                        certType::AbstractString = "0",
                        organization::AbstractString = "0",
                        occupation::AbstractString = "0",
                        agency::AbstractString = "0",
                        sortColumn::AbstractString = "0",
                        sortDirections::AbstractString = "0",
                        startRecord::Integer = 0,
                        limitRecord::Integer = 10,
                        )

Consumes the `List Certifications` endpoint of the CareerOneStop API.

# Example

```jldoctest
julia> nurse = certificationfinder("nurse")
JSON3.Object{Vector{UInt8}, Vector{UInt64}} with 13 entries:
  :CertList                  => JSON3.Object[{…
  :CertAccredAgencyLegend    => JSON3.Object[{…
  :RecordCount               => 561
  :DidYouMean                => nothing
  :AutoCorrection            => nothing
  :IsDirectMatch             => "K"
  :OccupationCountList       => {…
  :IndustryCountList         => {…
  :TypeCountList             => {…
  :OrgCountList              => {…
  :RelatedCountList          => {…
  :CertDetail                => nothing
  :CertAccredAgencyCountList => {…

julia> @views nurse.CertList[1:2]
2-element view(::JSON3.Array{JSON3.Object, Vector{UInt8}, SubArray{UInt64, 1, Vector{UInt64}, Tuple{UnitRange{Int64}}, true}}, 1:2) with eltype JSON3.Object:
 {
                     "Id": "6126-C",
                   "Name": "Gerontological Nursing",
                    "Url": "https://www.nursingworld.org/our-certifications/gerontological-nurse/",
           "Organization": "ANA Enterprise",
                   "Type": "Specialty",
              "TypeOrder": "C",
                "Related": "",
   "CertAccredAgencyList": [
                             {
                                 "Name": "In-Demand",
                                "Order": "1"
                             },
                             {
                                 "Name": "NCCA",
                                "Order": "2"
                             },
                             {
                                 "Name": "MILITARY",
                                "Order": "4"
                             },
                             {
                                 "Name": "ABNS",
                                "Order": "7"
                             }
                           ],
    "OrganizationAddress": "8515 Georgia Avenue, Suite 400, Silver Spring, MD  20910-3492",
        "OrganizationUrl": "https://www.nursingworld.org/",
                "Acronym": "RN-BC",
            "Description": "The ANCC Gerontological Nursing board certification examination is a competency based examination that provides a valid and reliable assessment of the entry-level clinical knowledge and skills of registered nurses in the gerontological specialty after initial RN licensure. Once you complete eligibility requirements to take the certification examination and successfully pass the exam, you are awarded the credential: Registered Nurse-Board Certified (RN-BC).",
         "CertDetailList": [
                             {
                                 "Name": "More than two years of education or training after high school required?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "More than two years of work experience required?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Oral or Written Exam Required?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Renewal Required?",
                                "Value": "Every 5  Year(s)"
                             },
                             {
                                 "Name": "Renew through Continuing Educational Units(CEU)?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Renew through Re-Examination?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Renew through Continuing Professional Development(CPD)?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Does applicant have choice of at least two options from above for renewal (CEU, CPD, or exam)?",
                                "Value": "Yes"
                             }
                           ],
         "CertTestOption": [],
             "ExamDetail": nothing
}
 {
                     "Id": "6132-C",
                   "Name": "Pediatric Nursing",
                    "Url": "https://www.nursingworld.org/our-certifications/pediatric-nurse/",
           "Organization": "ANA Enterprise",
                   "Type": "Specialty",
              "TypeOrder": "C",
                "Related": "",
   "CertAccredAgencyList": [
                             {
                                 "Name": "In-Demand",
                                "Order": "1"
                             },
                             {
                                 "Name": "NCCA",
                                "Order": "2"
                             },
                             {
                                 "Name": "ANSI",
                                "Order": "3"
                             },
                             {
                                 "Name": "ABNS",
                                "Order": "7"
                             }
                           ],
    "OrganizationAddress": "8515 Georgia Avenue, Suite 400, Silver Spring, MD  20910-3492",
        "OrganizationUrl": "https://www.nursingworld.org/",
                "Acronym": "RN-BC",
            "Description": "The ANCC Pediatric Nursing board certification examination is a competency based examination that provides a valid and reliable assessment of the entry-level clinical knowledge and skills of registered nurses in the pediatric specialty after initial RN licensure. Once you complete eligibility requirements to take the certification examination and successfully pass the exam, you are awarded the credential: Registered Nurse-Board Certified (RN-BC).",
         "CertDetailList": [
                             {
                                 "Name": "More than two years of education or training after high school required?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "More than two years of work experience required?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Oral or Written Exam Required?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Renewal Required?",
                                "Value": "Every 5  Year(s)"
                             },
                             {
                                 "Name": "Renew through Continuing Educational Units(CEU)?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Renew through Re-Examination?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Renew through Continuing Professional Development(CPD)?",
                                "Value": "Yes"
                             },
                             {
                                 "Name": "Does applicant have choice of at least two options from above for renewal (CEU, CPD, or exam)?",
                                "Value": "Yes"
                             }
                           ],
         "CertTestOption": [],
             "ExamDetail": nothing
}

```
"""
function certificationfinder(keyword::AbstractString,
                             userID::AbstractString = ENV["API_CAREERONESTOP_USER"],
                             token::AbstractString = ENV["API_CAREERONESTOP"],
                             directFlag::AbstractString = "0",
                             industry::AbstractString = "0",
                             certType::AbstractString = "0",
                             organization::AbstractString = "0",
                             occupation::AbstractString = "0",
                             agency::AbstractString = "0",
                             sortColumn::AbstractString = "0",
                             sortDirections::AbstractString = "0",
                             startRecord::Integer = 0,
                             limitRecord = 10,
                             )
    response = request("GET",
                       URI(scheme = "https",
                           host = "api.careeronestop.org",
                           path = "/v1/certificationfinder/$userID/$keyword/$directFlag/$industry/$certType/$organization/$occupation/$agency/$sortColumn/$sortDirections/$startRecord/$limitRecord"),
                       ["Authorization" => "Bearer $token"],
                       )
    @assert response.status == 200
    json = JSON3.read(response.body)
end
