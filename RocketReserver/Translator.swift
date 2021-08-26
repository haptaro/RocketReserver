//
//  Translator.swift
//  Translator
//
//  Created by Kotaro Fukuo on 2021/08/26.
//

import Foundation

struct Translator {
  func translate(from: LaunchListQuery.Data.Launch.Launch) -> UILaunch {
    UILaunch(
      id: from.id,
      site: from.site,
      missionName: from.mission?.name,
      missionPatchURLString: from.mission?.missionPatch)
  }
}
