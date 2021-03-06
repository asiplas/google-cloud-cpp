#!/usr/bin/env bash
#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

readonly SITE="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads"
readonly TARBALL="google-cloud-sdk-282.0.0-linux-x86_64.tar.gz"
readonly SHA256="db2fd176a998381ef937bd9f9e83b16eadff864111255d771976d654c961fc95"
wget -q "${SITE}/${TARBALL}"

echo "${SHA256} ${TARBALL}" | sha256sum --check -
tar x -C /usr/local -f "${TARBALL}"
/usr/local/google-cloud-sdk/bin/gcloud --quiet components install cbt bigtable
