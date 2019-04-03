//
//  Common.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import UIKit

let REVIEW_URL = "https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json?count=%d&page=%d&rating=%@&sortBy=%@&direction=%@"

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
let FONT_TEXT_BOLD_XL = UIFont.boldSystemFont(ofSize: FONT_SIZE_XL)
let FONT_TEXT_BOLD_XXXL = UIFont.boldSystemFont(ofSize: FONT_SIZE_XXXL)

// MARK: - Coloured fonts used in app

let ATTR_BAR_TITLE = [NSAttributedString.Key.font: FONT_TEXT_BOLD_L, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_BAR_TITLE_XXXL = [NSAttributedString.Key.font: FONT_TEXT_BOLD_XXXL, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_HEADING_BOLD = [NSAttributedString.Key.font: FONT_TEXT_BOLD_XL, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_TEXT = [NSAttributedString.Key.font: FONT_TEXT_M, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_TEXT_BLACK = [NSAttributedString.Key.font: FONT_TEXT_M, NSAttributedString.Key.foregroundColor: UIColor.black]
let ATTR_TEXT_BOLD = [NSAttributedString.Key.font: FONT_TEXT_BOLD_M, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_SUB = [NSAttributedString.Key.font: FONT_TEXT_S, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_SUB_BOLD = [NSAttributedString.Key.font: FONT_TEXT_BOLD_S, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]
let ATTR_BUTTON = [NSAttributedString.Key.font: FONT_TEXT_BOLD_S, NSAttributedString.Key.foregroundColor: APP_BUTTON_COLOUR]
let ATTR_BUTTON_FG = [NSAttributedString.Key.font: FONT_TEXT_BOLD_S, NSAttributedString.Key.foregroundColor: APP_TEXT_COLOUR]

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

enum RatingFilter: String {
    case any = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
}

// MARK: - General Config

let DEFAULT_PAGE_COUNT = 20
let DEFAULT_RATING_FILTER = RatingFilter.any
let DEFAULT_SORT_BY = SortBy.date_of_review
let DEFAULT_DIRECTION = Direction.desc

let GENERAL_SPACING: CGFloat = 12.0
let SMALL_SPACING = GENERAL_SPACING / 2.0
let LARGE_SPACING = 2.0 * GENERAL_SPACING
let EXTRA_LARGE_SPACING = 3.0 * GENERAL_SPACING
let GENERAL_ITEM_WIDTH: CGFloat = 44.0
let GENERAL_ITEM_HEIGHT = GENERAL_ITEM_WIDTH
let GENERAL_ITEM_RADIUS = GENERAL_ITEM_WIDTH / 2.0
let SMALL_ITEM_WIDTH = GENERAL_ITEM_WIDTH / 2.0
let SMALL_ITEM_HEIGHT = SMALL_ITEM_WIDTH
let SMALL_ITEM_RADIUS = SMALL_ITEM_WIDTH / 2.0
let SECTION_HEADER_HEIGHT: CGFloat = IS_SMALL_DEVICE ? 44.0 : 56.0
let GENERAL_CELL_HEIGHT: CGFloat = IS_SMALL_DEVICE ? 44.0 : 56.0
let TOP_BAR_HEIGHT: CGFloat = 44.0

let DELAY = 0.5
let ANIMATION_DURATION = 0.3
let TIME_OUT_INTERVAL = 300.0
let TIME_OUT_RESOURCE = 300.0

let WHITESPACE = " "

let ERROR_STATUS_CODE = 500

// MARK: - Keys
