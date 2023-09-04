package com.foodtosave.clearsale_behavior_analytics.clear_sale_behavior_analytics

import android.content.Context
import sale.clear.behavior.android.Behavior

class ClearSaleManager(private val context: Context) {
    private lateinit var behavior: Behavior

    private var started = false

    fun blockGeolocation() = behavior.blockLocation()

    fun blockAppList() = behavior.blockAppsList()

    fun start(appId: String) {

        if(started) {
            return
        }

        behavior = Behavior.getInstance(context, appId)
        started = true
        behavior.start()
    }

    fun collectInformation (): String {
        val sessionId = behavior.generateSessionID()
        behavior.collectDeviceInformation(sessionId)
        return sessionId
    }

    fun stop() = behavior.stop()
}