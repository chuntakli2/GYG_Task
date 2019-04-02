//
//  Common.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import UIKit

let REVIEW_URL = "https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json?count=%d&page=%d&rating=%d&sortBy=%@&direction=%@"
// https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json?count=5&page=0&rating=0&sortBy=date_of_review&direction=DESC

let REALM_SCHEMA_VERSION: UInt64 = 0

// Get AppDelegate
let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate

let IOS_VERSION = (UIDevice.current.systemVersion as NSString).floatValue
let IS_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)
let SMALL_DEVICE_WIDTH: CGFloat = 320.0
let SMALL_DEVICE_HEIGHT: CGFloat = 568.0
let IS_SMALL_DEVICE = (UIScreen.main.bounds.width * UIScreen.main.bounds.height <= SMALL_DEVICE_WIDTH * SMALL_DEVICE_HEIGHT)

// MARK: - Colour setup

let APP_FOREGROUND_COLOUR = UIColor.colour(fromHexString: "ff553c")

let APP_BACKGROUND_COLOUR = UIColor.colour(fromHexString: "ffffff")

let APP_TEXT_COLOUR = UIColor.colour(fromHexString: "ff8c4b")
let APP_BUTTON_COLOUR = UIColor.colour(fromHexString: "ff553c")

// MARK: - Font setup

let FONT_SIZE_XS: CGFloat = 13.0
let FONT_SIZE_S: CGFloat = 14.0
let FONT_SIZE_M: CGFloat = 16.0
let FONT_SIZE_L: CGFloat = 17.0
let FONT_SIZE_XL: CGFloat = 18.0
let FONT_SIZE_XXL: CGFloat = 28.0
let FONT_SIZE_XXXL: CGFloat = 35.0

let FONT_DISPLAY_XXL = UIFont.systemFont(ofSize: FONT_SIZE_XXL)

let FONT_TEXT_XS = UIFont.systemFont(ofSize: FONT_SIZE_XS)
let FONT_TEXT_S = UIFont.systemFont(ofSize: FONT_SIZE_S)
let FONT_TEXT_M = UIFont.systemFont(ofSize: FONT_SIZE_M)
let FONT_TEXT_L = UIFont.systemFont(ofSize: FONT_SIZE_L)
let FONT_TEXT_XL = UIFont.systemFont(ofSize: FONT_SIZE_XL)

let FONT_TEXT_LIGHT_L = UIFont.systemFont(ofSize: FONT_SIZE_L)

let FONT_TEXT_BOLD_S = UIFont.boldSystemFont(ofSize: FONT_SIZE_S)
let FONT_TEXT_BOLD_M = UIFont.boldSystemFont(ofSize: FONT_SIZE_M)
let FONT_TEXT_BOLD_L = UIFont.boldSystemFont(ofSize: FONT_SIZE_L)
let FONT_TEXT_BOLD_XXXL = UIFont.boldSystemFont(ofSize: FONT_SIZE_XXXL)

// MARK: - Coloured fonts used in app

let ATTR_BAR_TITLE = [NSAttributedString.Key.font: FONT_TEXT_BOLD_L, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_BAR_TITLE_WHITE = [NSAttributedString.Key.font: FONT_TEXT_BOLD_L, NSAttributedString.Key.foregroundColor: UIColor.white]
let ATTR_BAR_TITLE_XXXL = [NSAttributedString.Key.font: FONT_TEXT_BOLD_XXXL, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_HEADING = [NSAttributedString.Key.font: FONT_TEXT_XL, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_TEXT = [NSAttributedString.Key.font: FONT_TEXT_M, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_TEXT_WHITE = [NSAttributedString.Key.font: FONT_TEXT_M, NSAttributedString.Key.foregroundColor: UIColor.white]
let ATTR_TEXT_BLACK = [NSAttributedString.Key.font: FONT_TEXT_M, NSAttributedString.Key.foregroundColor: UIColor.black]
let ATTR_TEXT_BOLD = [NSAttributedString.Key.font: FONT_TEXT_BOLD_M, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_TEXT_WHITE_BOLD = [NSAttributedString.Key.font: FONT_TEXT_BOLD_M, NSAttributedString.Key.foregroundColor: UIColor.white]
let ATTR_SUB = [NSAttributedString.Key.font: FONT_TEXT_S, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_SUB_BOLD = [NSAttributedString.Key.font: FONT_TEXT_BOLD_S, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_TAB = [NSAttributedString.Key.font: FONT_TEXT_XS, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_BUTTON = [NSAttributedString.Key.font: FONT_TEXT_BOLD_S, NSAttributedString.Key.foregroundColor: APP_BUTTON_COLOUR]
let ATTR_BUTTON_FG = [NSAttributedString.Key.font: FONT_TEXT_BOLD_S, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_RESET = [NSAttributedString.Key.font: FONT_TEXT_XS, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]

// MARK: - Font end

// MARK: - enum

enum SortBy: String {
    case date_of_review = "date_of_review"
    case rating = "rating"
}

enum Direction: String {
    case asc = "asc"
    case desc = "desc"
}

// MARK: - General Config

let GENERAL_SPACING: CGFloat = 12.0
let BAR_SPACING: CGFloat = 11.0
let SMALL_SPACING = GENERAL_SPACING / 2.0
let LARGE_SPACING = 2.0 * GENERAL_SPACING
let EXTRA_LARGE_SPACING = 3.0 * GENERAL_SPACING
let BACK_BUTTON_SPACING: CGFloat = 8.0
let LOGO_WIDTH: CGFloat = 40.0
let LOGO_HEIGHT = LOGO_WIDTH
let GENERAL_ITEM_WIDTH: CGFloat = 44.0
let GENERAL_ITEM_HEIGHT = GENERAL_ITEM_WIDTH
let GENERAL_ITEM_RADIUS = GENERAL_ITEM_WIDTH / 2.0
let SMALL_ITEM_WIDTH = GENERAL_ITEM_WIDTH / 2.0
let SMALL_ITEM_HEIGHT = SMALL_ITEM_WIDTH
let SMALL_ITEM_RADIUS = SMALL_ITEM_WIDTH / 2.0
let SECTION_HEADER_HEIGHT: CGFloat = IS_SMALL_DEVICE ? 44.0 : 56.0
let GENERAL_CELL_HEIGHT: CGFloat = IS_SMALL_DEVICE ? 44.0 : 56.0
let TOP_BAR_HEIGHT: CGFloat = 44.0
let NAVIGATION_BAR_HEIGHT: CGFloat = 64.0
let TEXT_FIELD_LEFT_VIEW_FRAME = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0)
let UNDERLINE_HEIGHT: CGFloat = 0.5

let DELAY = 0.5
let ANIMATION_DURATION = 0.3
let UPDATE_NEEDED_TIMER: Double = 24.0 * 60.0 * 60.0
let ITEM_DURATION: Double = 60.0 * 60.0 * 24.0 * 28.0
let TIME_OUT_INTERVAL = 300.0
let TIME_OUT_RESOURCE = 300.0

let WHITESPACE = " "
let MAXIMUM_CHARACTERS_COUNT = 140
let DELAY_DURATION = 5.0
let REWIND_SECONDS = 10.0
let TIME_SCALE: Int32 = 600
let TEST_TIME_OUT_INTERVAL = 5.0

let SUCCESS_STATUS_CODE = 200
let ERROR_STATUS_CODE = 500

// MARK: - Keys
