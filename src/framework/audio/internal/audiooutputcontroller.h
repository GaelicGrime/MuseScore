/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
#ifndef MU_NOTATION_AUDIOOUTPUTCONTROLLER_H
#define MU_NOTATION_AUDIOOUTPUTCONTROLLER_H

#include "async/asyncable.h"

#include "modularity/ioc.h"
#include "../iaudioconfiguration.h"
#include "../iaudiodriver.h"

namespace mu::audio {
class AudioOutputController : public async::Asyncable
{
    INJECT(audio, IAudioConfiguration, configuration)
    INJECT(audio, IAudioDriver, audioDriver)

public:
    void init();

private:
    void checkConnection();

    void connectCurrentOutputDevice();
};
}

#endif // MU_NOTATION_AUDIOOUTPUTCONTROLLER_H
