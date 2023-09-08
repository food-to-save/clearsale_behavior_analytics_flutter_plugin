package com.foodtosave.clearsale_behavior_analytics.clear_sale_behavior_analytics

import android.content.Context
import sale.clear.behavior.android.Behavior

class ClearSaleManager(private val context: Context) {
    private lateinit var behavior: Behavior

    private var started = false


    private fun throwIfIsNotStarted() {
        if(!started) {
            throw IllegalStateException("you should call start before this method")
        }
    }

    fun blockGeolocation() {
        throwIfIsNotStarted()
        behavior.blockLocation()
    }

    fun blockAppList() {
        throwIfIsNotStarted()
        behavior.blockAppsList()
    }

    fun start(appId: String?) {

        if(appId == null) {
            throw IllegalStateException("appId must be non null")
        }

        if(started) {
            return
        }

        behavior = Behavior.getInstance(context, appId)
        started = true
        behavior.start()
    }

    fun collectInformation (): String? {
        throwIfIsNotStarted()

        val sessionId = behavior.generateSessionID()
        behavior.collectDeviceInformation(sessionId)
        return sessionId
    }

    fun stop() {
        throwIfIsNotStarted()
        behavior.stop()
    }
}